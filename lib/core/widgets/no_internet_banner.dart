import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/core/network/connectivity_cubit.dart';
import 'package:github_users/generated/locale_keys.g.dart';

class NoInternetBanner extends StatelessWidget {
  const NoInternetBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final isConnected = context.watch<ConnectivityCubit>().state;
    final theme = Theme.of(context);
    return AnimatedSize(
      duration: const Duration(milliseconds: 250),
      child: isConnected
          ? const SizedBox(width: double.infinity)
          : Material(
              color: Theme.of(context).colorScheme.error,
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        LocaleKeys.errors_no_internet.tr(),
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: theme.colorScheme.onError,
                        ),
                        textAlign: .center,
                      ),
                      Text(
                        LocaleKeys.errors_no_internet_description.tr(),
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: theme.colorScheme.onError,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
