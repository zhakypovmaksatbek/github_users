import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/app/router/app_router.dart';
import 'package:github_users/core/constants/app_const.dart';
import 'package:github_users/core/di/injection.dart';
import 'package:github_users/core/network/connectivity_cubit.dart';
import 'package:github_users/core/theme/app_theme.dart';
import 'package:github_users/core/widgets/no_internet_banner.dart';
import 'package:github_users/features/settings/presentation/bloc/theme_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<ConnectivityCubit>()),
        BlocProvider.value(value: getIt<ThemeCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) => MaterialApp.router(
          title: AppConst.appName,
          routerConfig: getIt<AppRouter>().config(),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return Column(
              children: [
                Expanded(child: child ?? const SizedBox.shrink()),
                const NoInternetBanner(),
              ],
            );
          },
        ),
      ),
    );
  }
}
