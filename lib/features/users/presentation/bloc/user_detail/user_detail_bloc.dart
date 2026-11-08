// user_detail_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/core/error/failure.dart';
import 'package:github_users/core/network/cancelable_mixin.dart';
import 'package:github_users/features/users/domain/repositories/users_repository.dart';
import 'package:github_users/features/users/presentation/bloc/user_detail/user_detail_event.dart';
import 'package:github_users/features/users/presentation/bloc/user_detail/user_detail_state.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState>
    with CancelableMixin<UserDetailState> {
  UserDetailBloc(this._repository) : super(const UserDetailLoading()) {
    on<UserDetailRequested>(_onRequested);
  }

  final UsersRepository _repository;

  Future<void> _onRequested(
    UserDetailRequested event,
    Emitter<UserDetailState> emit,
  ) async {
    emit(const UserDetailLoading());
    final token = renewCancelToken('detail');
    try {
      emit(
        UserDetailLoaded(await _repository.getUserDetail(event.login, token)),
      );
    } on CancelledFailure {
      return;
    } on Failure catch (f) {
      emit(UserDetailError(f));
    }
  }
}
