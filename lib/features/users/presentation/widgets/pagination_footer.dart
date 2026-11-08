// widgets/pagination_footer.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:github_users/core/error/failure.dart';
import 'package:github_users/core/error/failure_ui.dart';
import 'package:github_users/generated/locale_keys.g.dart';

class PaginationFooter extends StatelessWidget {
  const PaginationFooter({
    super.key,
    required this.isLoading,
    required this.failure,
    required this.onRetry,
  });

  final bool isLoading;
  final Failure? failure;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator.adaptive()),
      );
    }
    if (failure != null) {
      final theme = Theme.of(context);
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(failure!.localizedMessage, textAlign: TextAlign.center),
            if (failure!.rateLimitRetryAt(context.locale.languageCode)
                case final retryAt?)
              Text(
                retryAt,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
            TextButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: Text(LocaleKeys.buttons_retry.tr()),
            ),
          ],
        ),
      );
    }
    return const SizedBox(height: 16);
  }
}
