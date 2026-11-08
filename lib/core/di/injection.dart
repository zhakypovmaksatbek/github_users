import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:github_users/app/router/app_router.dart';
import 'package:github_users/core/constants/app_const.dart';
import 'package:github_users/core/network/connectivity_cubit.dart';
import 'package:github_users/core/network/connectivity_service.dart';
import 'package:github_users/features/settings/presentation/bloc/theme_cubit.dart';
import 'package:github_users/features/users/data/datasources/github_api.dart';
import 'package:github_users/features/users/data/repositories/users_repository_impl.dart';
import 'package:github_users/features/users/domain/repositories/users_repository.dart';
import 'package:github_users/features/users/presentation/bloc/user_bloc/users_bloc.dart';
import 'package:github_users/features/users/presentation/bloc/user_detail/user_detail_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupDi() async {
  final prefs = await SharedPreferences.getInstance();
  // Core
  getIt.registerSingleton<SharedPreferences>(prefs);

  getIt.registerLazySingleton<AppRouter>(AppRouter.new);
  getIt.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(getIt<SharedPreferences>()),
  );
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConst.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Accept': 'application/vnd.github+json'},
      ),
    );
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(responseBody: false));
    }

    return dio;
  });

  getIt.registerLazySingleton<ConnectivityService>(ConnectivityServiceImpl.new);
  getIt.registerLazySingleton<ConnectivityCubit>(
    () => ConnectivityCubit(getIt<ConnectivityService>()),
  );
  // Data
  getIt.registerLazySingleton<GithubApi>(() => GithubApi(getIt<Dio>()));

  getIt.registerLazySingleton<UsersRepository>(
    () => UsersRepositoryImpl(getIt<GithubApi>()),
  );

  getIt.registerFactory<UsersBloc>(() => UsersBloc(getIt<UsersRepository>()));
  getIt.registerFactory<UserDetailBloc>(
    () => UserDetailBloc(getIt<UsersRepository>()),
  );
}
