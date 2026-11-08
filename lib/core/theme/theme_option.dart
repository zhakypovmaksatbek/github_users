import 'package:flutter/material.dart';
import 'package:github_users/generated/locale_keys.g.dart';

enum ThemeOption {
  system(ThemeMode.system, LocaleKeys.general_system),
  light(ThemeMode.light, LocaleKeys.general_light),
  dark(ThemeMode.dark, LocaleKeys.general_dark);

  const ThemeOption(this.mode, this.labelKey);

  final ThemeMode mode;
  final String labelKey;
}
