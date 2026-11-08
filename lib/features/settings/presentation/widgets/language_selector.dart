// widgets/language_selector.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:github_users/app/localization/app_localization.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final current = Locales.current(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          for (final (i, item) in Locales.values.indexed) ...[
            if (i > 0) const Divider(),
            ListTile(
              title: Text(item.label),
              trailing: item == current
                  ? Icon(
                      Icons.check_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : null,
              onTap: () => context.setLocale(item.locale),
            ),
          ],
        ],
      ),
    );
  }
}
