import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_users/core/error/failure.dart';
import 'package:github_users/features/users/domain/entities/user.dart';

part 'users_state.freezed.dart';

enum UsersStatus { loading, success, failure }

@freezed
abstract class UsersState with _$UsersState {
  const UsersState._();

  const factory UsersState({
    @Default(UsersStatus.loading) UsersStatus status,
    @Default(<User>[]) List<User> users,
    @Default(false) bool hasReachedMax,
    @Default(false) bool isLoadingMore,
    Failure? failure,
  }) = _UsersState;

  bool get hasPageError => status == UsersStatus.success && failure != null;
}
