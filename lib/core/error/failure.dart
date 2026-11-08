sealed class Failure implements Exception {
  const Failure();
}

final class NoInternetFailure extends Failure {
  const NoInternetFailure();
}

final class RateLimitFailure extends Failure {
  const RateLimitFailure({this.resetsAt});

  final DateTime? resetsAt;
}

final class NotFoundFailure extends Failure {
  const NotFoundFailure();
}

final class UnknownFailure extends Failure {
  const UnknownFailure([this.message]);
  final String? message;
}

final class CancelledFailure extends Failure {
  const CancelledFailure();
}
