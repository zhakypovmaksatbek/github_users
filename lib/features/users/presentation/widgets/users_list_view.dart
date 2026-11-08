import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/core/widgets/error_view.dart';
import 'package:github_users/features/users/presentation/bloc/user_bloc/users_bloc.dart';
import 'package:github_users/features/users/presentation/bloc/user_bloc/users_event.dart';
import 'package:github_users/features/users/presentation/bloc/user_bloc/users_state.dart';
import 'package:github_users/features/users/presentation/widgets/users_list_body.dart';

class UsersListView extends StatelessWidget {
  const UsersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      buildWhen: (prev, curr) => prev.status != curr.status,
      builder: (context, state) => switch (state.status) {
        UsersStatus.loading => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        UsersStatus.failure => ErrorView(
          failure: state.failure!,
          onRetry: () => context.read<UsersBloc>().add(const UsersStarted()),
        ),
        UsersStatus.success => const UsersListBody(),
      },
    );
  }
}
