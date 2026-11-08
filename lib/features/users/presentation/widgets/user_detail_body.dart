import 'package:flutter/material.dart';
import 'package:github_users/features/users/domain/entities/user_detail.dart';
import 'package:github_users/features/users/presentation/widgets/user_info_section.dart';
import 'package:github_users/features/users/presentation/widgets/user_stats_row.dart';

class UserDetailBody extends StatelessWidget {
  const UserDetailBody({super.key, required this.detail});

  final UserDetail detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserStatsRow(
          followers: detail.followers,
          following: detail.following,
          repos: detail.publicRepos,
        ),
        const SizedBox(height: 24),
        UserInfoSection(detail: detail),
      ],
    );
  }
}
