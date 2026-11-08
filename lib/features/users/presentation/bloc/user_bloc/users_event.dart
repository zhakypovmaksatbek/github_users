import 'dart:async';

sealed class UsersEvent {
  const UsersEvent();
}

final class UsersStarted extends UsersEvent {
  const UsersStarted();
}

final class UsersRefreshed extends UsersEvent {
  const UsersRefreshed(this.completer);
  final Completer<void> completer;
}

final class UsersNextPageRequested extends UsersEvent {
  const UsersNextPageRequested({this.isRetry = false});
  final bool isRetry;
}
