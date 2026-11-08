// widgets/user_avatar.dart  → hem listede hem detayda kullanılır
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, required this.url, this.radius = 24});

  final String url;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final size = radius * 2;
    final pixelRatio = MediaQuery.devicePixelRatioOf(context);

    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: url,
        width: size,
        height: size,
        fit: BoxFit.cover,
        memCacheWidth: (size * pixelRatio).round(),
        placeholder: (_, _) => _AvatarPlaceholder(size: size),
        errorWidget: (_, _, _) => _AvatarPlaceholder(size: size),
      ),
    );
  }
}

class _AvatarPlaceholder extends StatelessWidget {
  const _AvatarPlaceholder({required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      width: size,
      height: size,
      color: scheme.surfaceContainerHighest,
      child: Icon(Icons.person, size: size * 0.55, color: scheme.outline),
    );
  }
}
