import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:github_users/features/settings/presentation/pages/settings_page.dart';
import 'package:github_users/features/splash/presentation/page/splash_page.dart';
import 'package:github_users/features/users/domain/entities/user.dart';
import 'package:github_users/features/users/presentation/pages/user_detail_page.dart';
import 'package:github_users/features/users/presentation/pages/users_list_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true, path: '/'),
    AutoRoute(page: UsersListRoute.page, path: '/users'),
    AutoRoute(page: UserDetailRoute.page, path: '/users/:id'),
    AutoRoute(page: SettingsRoute.page, path: '/settings'),
  ];
}
