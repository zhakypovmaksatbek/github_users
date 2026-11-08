import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:github_users/core/error/failure.dart';
import 'package:github_users/core/error/failure_ui.dart';
import 'package:github_users/generated/locale_keys.g.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.failure, required this.onRetry});

  final Failure failure;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(failure.icon, size: 56, color: theme.colorScheme.outline),
            const SizedBox(height: 16),
            Text(
              failure.localizedMessage,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium,
            ),
            if (failure.rateLimitRetryAt(context.locale.languageCode)
                case final retryAt?) ...[
              const SizedBox(height: 8),
              Text(
                retryAt,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
            ],
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: Text(LocaleKeys.buttons_retry.tr()),
            ),
          ],
        ),
      ),
    );
  }
}
