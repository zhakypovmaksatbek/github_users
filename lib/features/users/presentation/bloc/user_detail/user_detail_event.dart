sealed class UserDetailEvent {
  const UserDetailEvent();
}

final class UserDetailRequested extends UserDetailEvent {
  const UserDetailRequested(this.login);
  final String login;
}
