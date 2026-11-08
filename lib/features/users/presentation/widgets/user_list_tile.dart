// widgets/user_list_tile.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_users/features/users/domain/entities/user.dart';
import 'package:github_users/features/users/presentation/widgets/user_avatar.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({super.key, required this.user, required this.onTap});

  final User user;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Hero(
        tag: 'avatar_${user.id}',
        transitionOnUserGestures: true,
        child: UserAvatar(url: user.avatarUrl, radius: 28),
      ),
      title: Text(
        user.login,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        'ID: ${user.id}',
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.outline,
        ),
      ),
      trailing: const Icon(CupertinoIcons.chevron_right),
    );
  }
}
