sealed class Failure implements Exception {
  const Failure();
}

final class NoInternetFailure extends Failure {
  const NoInternetFailure();
}

final class RateLimitFailure extends Failure {
  const RateLimitFailure({this.resetsAt});

  /// UTC instant from the `x-ratelimit-reset` header, when GitHub sends one.
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
