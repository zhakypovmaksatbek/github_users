import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:github_users/features/users/domain/entities/user_detail.dart';
import 'package:github_users/features/users/presentation/widgets/user_info_tile.dart';
import 'package:github_users/generated/locale_keys.g.dart';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({super.key, required this.detail});

  final UserDetail detail;

  @override
  Widget build(BuildContext context) {
    final joined = detail.createdAt == null
        ? null
        : DateFormat.yMMMd(context.locale.languageCode)
              .format(detail.createdAt!);

    final tiles = <(IconData, String, String?)>[
      (
        Icons.location_on_outlined,
        LocaleKeys.general_location.tr(),
        detail.location,
      ),
      (
        Icons.business_outlined,
        LocaleKeys.general_company.tr(),
        detail.company,
      ),
      (Icons.link, LocaleKeys.general_website.tr(), detail.blog),
      (Icons.calendar_today_outlined, LocaleKeys.general_joined.tr(), joined),
    ].where((t) => t.$3?.trim().isNotEmpty ?? false).toList();

    if (tiles.isEmpty) return const SizedBox.shrink();

    return Card.outlined(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          for (var i = 0; i < tiles.length; i++) ...[
            if (i > 0) const Divider(height: 1),
            UserInfoTile(
              icon: tiles[i].$1,
              label: tiles[i].$2,
              value: tiles[i].$3!,
            ),
          ],
        ],
      ),
    );
  }
}
