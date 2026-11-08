import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:github_users/core/error/failure.dart';
import 'package:github_users/generated/locale_keys.g.dart';

extension FailureUi on Failure {
  String get localizedMessage => switch (this) {
    NoInternetFailure() => LocaleKeys.errors_no_internet.tr(),
    RateLimitFailure() => LocaleKeys.errors_rate_limit.tr(),
    NotFoundFailure() => LocaleKeys.errors_not_found.tr(),
    UnknownFailure() => LocaleKeys.errors_unknown.tr(),
    CancelledFailure() => LocaleKeys.errors_cancelled.tr(),
  };

  /// "Try again at 14:32" when GitHub told us when the limit resets.
  /// Kyrgyz adds the locative that matches the last number: 23 → тө, 32 → де.
  String? rateLimitRetryAt(String languageCode) => switch (this) {
    RateLimitFailure(:final resetsAt?) =>
      LocaleKeys.errors_rate_limit_retry_at.tr(
        namedArgs: {'time': _clock(resetsAt, languageCode)},
      ),
    _ => null,
  };

  IconData get icon => switch (this) {
    NoInternetFailure() => Icons.wifi_off_rounded,
    RateLimitFailure() => Icons.hourglass_top_rounded,
    NotFoundFailure() => Icons.person_off_outlined,
    UnknownFailure() => Icons.error_outline_rounded,
    CancelledFailure() => Icons.cancel_rounded,
  };
}

String _clock(DateTime utc, String languageCode) {
  final local = utc.toLocal();
  final hour = local.hour.toString().padLeft(2, '0');
  final minute = local.minute.toString().padLeft(2, '0');
  final time = '$hour:$minute';
  if (languageCode != 'ky') return time;

  // 04:32 is read "...экиде"; 04:00 is read "төрттө", so :00 uses the hour.
  final spoken = local.minute == 0 ? local.hour : local.minute;
  return '$time ${_kyLocative(spoken)}';
}

/// Locative of the last Kyrgyz word in [n].
/// 1 бир+де, 3 үч+тө, 6 алты+да, 20 жыйырма+да, 27 …жети+де, 40 кырк+та.
String _kyLocative(int n) {
  final ones = n % 10;
  if (ones != 0) {
    return const [
      '',
      'де',
      'де',
      'тө',
      'тө',
      'те',
      'да',
      'де',
      'де',
      'да',
    ][ones];
  }
  return switch (n) {
    0 => 'дө', // нөл
    10 => 'до', // он
    20 => 'да', // жыйырма
    30 => 'да', // отуз
    40 => 'та', // кырк
    50 => 'дө', // элүү
    _ => 'да',
  };
}
