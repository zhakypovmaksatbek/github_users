import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:github_users/features/settings/presentation/widgets/language_selector.dart';
import 'package:github_users/features/settings/presentation/widgets/settings_section.dart';
import 'package:github_users/features/settings/presentation/widgets/theme_mode_selector.dart';
import 'package:github_users/generated/locale_keys.g.dart';

@RoutePage(name: "SettingsRoute")
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.locale;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.general_settings.tr(args: [locale.languageCode]),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          SettingsSection(
            title: LocaleKeys.general_theme,
            child: ThemeModeSelector(),
          ),
          SizedBox(height: 24),
          SettingsSection(
            title: LocaleKeys.general_language,
            child: LanguageSelector(),
          ),
        ],
      ),
    );
  }
}
