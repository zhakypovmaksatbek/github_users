import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:github_users/features/users/presentation/widgets/user_stat_card.dart';
import 'package:github_users/generated/locale_keys.g.dart';

class UserStatsRow extends StatelessWidget {
  const UserStatsRow({
    super.key,
    required this.followers,
    required this.following,
    required this.repos,
  });

  final int followers;
  final int following;
  final int repos;

  @override
  Widget build(BuildContext context) {
    final format = NumberFormat.compact(locale: context.locale.languageCode);
    return Row(
      children: [
        Expanded(
          child: UserStatCard(
            value: format.format(followers),
            label: LocaleKeys.general_followers.tr(),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: UserStatCard(
            value: format.format(following),
            label: LocaleKeys.general_following.tr(),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: UserStatCard(
            value: format.format(repos),
            label: LocaleKeys.general_repos.tr(),
          ),
        ),
      ],
    );
  }
}
