import 'package:github_users/core/error/failure.dart';
import 'package:github_users/features/users/domain/entities/user_detail.dart';

sealed class UserDetailState {
  const UserDetailState();
}

final class UserDetailLoading extends UserDetailState {
  const UserDetailLoading();
}

final class UserDetailLoaded extends UserDetailState {
  const UserDetailLoaded(this.detail);
  final UserDetail detail;
}

final class UserDetailError extends UserDetailState {
  const UserDetailError(this.failure);
  final Failure failure;
}
