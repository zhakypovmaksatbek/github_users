// users_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/core/error/failure.dart';
import 'package:github_users/core/network/cancelable_mixin.dart';
import 'package:github_users/features/users/domain/repositories/users_repository.dart';
import 'package:github_users/features/users/presentation/bloc/user_bloc/users_event.dart';
import 'package:github_users/features/users/presentation/bloc/user_bloc/users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState>
    with CancelableMixin<UsersState> {
  UsersBloc(this._repository) : super(const UsersState()) {
    on<UsersStarted>(_onStarted);
    on<UsersRefreshed>(_onRefreshed);
    on<UsersNextPageRequested>(_onNextPageRequested);
  }

  static const _perPage = 30;
  static const _firstPageKey = 'first_page';
  static const _nextPageKey = 'next_page';

  final UsersRepository _repository;

  Future<UsersState> _fetchFirstPage() async {
    cancelToken(_nextPageKey);
    final users = await _repository.getUsers(
      perPage: _perPage,
      cancelToken: renewCancelToken(_firstPageKey),
    );
    return UsersState(
      status: UsersStatus.success,
      users: users,
      hasReachedMax: users.length < _perPage,
    );
  }

  Future<void> _onStarted(UsersStarted event, Emitter<UsersState> emit) async {
    emit(const UsersState());
    try {
      emit(await _fetchFirstPage());
    } on CancelledFailure {
      return;
    } on Failure catch (f) {
      emit(UsersState(status: UsersStatus.failure, failure: f));
    }
  }

  Future<void> _onRefreshed(
    UsersRefreshed event,
    Emitter<UsersState> emit,
  ) async {
    try {
      emit(await _fetchFirstPage());
    } on Failure {
      // CancelledFailure handled in _fetchFirstPage
    } finally {
      event.completer.complete();
    }
  }

  Future<void> _onNextPageRequested(
    UsersNextPageRequested event,
    Emitter<UsersState> emit,
  ) async {
    final current = state;
    final canLoad =
        current.status == UsersStatus.success &&
        current.users.isNotEmpty &&
        !current.isLoadingMore &&
        !current.hasReachedMax &&
        (event.isRetry || current.failure == null);
    if (!canLoad) return;

    emit(current.copyWith(isLoadingMore: true, failure: null));
    try {
      final next = await _repository.getUsers(
        since: current.users.last.id,
        perPage: _perPage,
        cancelToken: renewCancelToken(_nextPageKey),
      );
      emit(
        current.copyWith(
          users: [...current.users, ...next],
          isLoadingMore: false,
          hasReachedMax: next.length < _perPage,
          failure: null,
        ),
      );
    } on CancelledFailure {
      return;
    } on Failure catch (f) {
      emit(current.copyWith(isLoadingMore: false, failure: f));
    }
  }
}
