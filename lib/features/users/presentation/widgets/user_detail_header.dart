import 'package:flutter/material.dart';
import 'package:github_users/features/users/domain/entities/user.dart';
import 'package:github_users/features/users/presentation/widgets/user_avatar.dart';

class UserDetailHeader extends StatelessWidget {
  const UserDetailHeader({super.key, required this.user, this.name, this.bio});

  final User user;
  final String? name;
  final String? bio;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final name = this.name?.trim();
    final bio = this.bio?.trim();
    final hasName = name != null && name.isNotEmpty;

    return Column(
      children: [
        Hero(
          tag: 'avatar_${user.id}',
          transitionOnUserGestures: true,
          child: UserAvatar(url: user.avatarUrl, radius: 56),
        ),
        const SizedBox(height: 16),
        Text(
          hasName ? name : user.login,
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        if (hasName)
          Text(
            '@${user.login}',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.outline,
            ),
          ),
        if (bio != null && bio.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            bio,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ],
    );
  }
}
