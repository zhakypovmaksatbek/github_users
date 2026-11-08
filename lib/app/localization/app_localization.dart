import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:github_users/core/constants/app_const.dart';
import 'package:github_users/generated/codegen_loader.g.dart';
import 'package:github_users/generated/locale_keys.g.dart';

final class AppLocalization extends EasyLocalization {
  AppLocalization({super.key, required super.child, super.startLocale})
    : super(
        path: AppConst.localePath,
        fallbackLocale: Locales.en.locale,
        saveLocale: true,
        useOnlyLangCode: true,
        supportedLocales: Locales.values.map((e) => e.locale).toList(),
        assetLoader: const CodegenLoader(),
      );
}

enum Locales {
  ky(Locale('ky'), LocaleKeys.language_ky),
  ru(Locale('ru'), LocaleKeys.language_ru),
  en(Locale('en'), LocaleKeys.language_en);

  final Locale locale;
  final String displayName;
  const Locales(this.locale, this.displayName);

  static Locales fromLocale(Locale locale) {
    return Locales.values.firstWhere(
      (e) => e.locale.languageCode == locale.languageCode,
      orElse: () => Locales.en,
    );
  }

  static Locales current(BuildContext context) {
    return fromLocale(context.locale);
  }
}

extension LocalesExtension on Locales {
  String get label => displayName.tr();
}
