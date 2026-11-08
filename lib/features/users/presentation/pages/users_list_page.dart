import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/app/router/app_router.dart';
import 'package:github_users/core/di/injection.dart';
import 'package:github_users/core/network/connectivity_cubit.dart';
import 'package:github_users/features/users/presentation/bloc/user_bloc/users_bloc.dart';
import 'package:github_users/features/users/presentation/bloc/user_bloc/users_event.dart';
import 'package:github_users/features/users/presentation/bloc/user_bloc/users_state.dart';
import 'package:github_users/features/users/presentation/widgets/users_list_view.dart';
import 'package:github_users/generated/locale_keys.g.dart';

@RoutePage(name: "UsersListRoute")
class UsersListPage extends StatefulWidget {
  const UsersListPage({super.key});

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  @override
  Widget build(BuildContext context) {
    final locale = context.locale;
    return BlocProvider(
      create: (_) => getIt<UsersBloc>()..add(const UsersStarted()),
      child: BlocListener<ConnectivityCubit, bool>(
        listenWhen: (prev, curr) => !prev && curr,
        listener: (context, _) {
          final bloc = context.read<UsersBloc>();
          final state = bloc.state;
          if (state.status == UsersStatus.failure) {
            bloc.add(const UsersStarted());
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              LocaleKeys.general_users.tr(args: [locale.languageCode]),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings_outlined),
                tooltip: LocaleKeys.general_settings.tr(),
                onPressed: () => context.router.push(const SettingsRoute()),
              ),
            ],
          ),
          body: const UsersListView(),
        ),
      ),
    );
  }
}
