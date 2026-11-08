import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_users/core/widgets/error_view.dart';
import 'package:github_users/features/users/domain/entities/user.dart';
import 'package:github_users/features/users/presentation/bloc/user_detail/user_detail_bloc.dart';
import 'package:github_users/features/users/presentation/bloc/user_detail/user_detail_event.dart';
import 'package:github_users/features/users/presentation/bloc/user_detail/user_detail_state.dart';
import 'package:github_users/features/users/presentation/widgets/user_detail_body.dart';
import 'package:github_users/features/users/presentation/widgets/user_detail_header.dart';

class UserDetailView extends StatelessWidget {
  const UserDetailView({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailBloc, UserDetailState>(
      builder: (context, state) {
        final loaded = state is UserDetailLoaded ? state.detail : null;

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            UserDetailHeader(user: user, name: loaded?.name, bio: loaded?.bio),
            const SizedBox(height: 24),
            switch (state) {
              UserDetailLoading() => const Padding(
                padding: EdgeInsets.all(32),
                child: Center(child: CircularProgressIndicator.adaptive()),
              ),
              UserDetailLoaded(detail: final d) => UserDetailBody(detail: d),
              UserDetailError(:final failure) => ErrorView(
                failure: failure,
                onRetry: () => context.read<UserDetailBloc>().add(
                  UserDetailRequested(user.login),
                ),
              ),
            },
          ],
        );
      },
    );
  }
}
