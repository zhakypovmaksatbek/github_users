// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ru = {
  "buttons": {
    "retry": "Попробовать снова"
  },
  "general": {
    "language": "Язык",
    "followers": "Подписчики",
    "following": "Подписки",
    "repos": "Репозитории",
    "location": "Местоположение",
    "company": "Компания",
    "website": "Веб-сайт",
    "joined": "Дата регистрации",
    "users": "Пользователи",
    "settings": "Настройки",
    "theme": "Тема",
    "system": "Системная",
    "light": "Светлая",
    "dark": "Тёмная"
  },
  "language": {
    "ky": "Кыргызча",
    "ru": "Русский",
    "en": "English"
  },
  "errors": {
    "no_internet": "Нет интернета",
    "no_internet_description": "Пожалуйста, проверьте ваше интернет-соединение и попробуйте снова.",
    "rate_limit": "Превышен лимит запросов",
    "rate_limit_description": "Пожалуйста, попробуйте снова позже.",
    "rate_limit_retry_at": "Попробуйте снова в {time}",
    "not_found": "Не найдено",
    "not_found_description": "Пожалуйста, попробуйте снова позже.",
    "unknown": "Неизвестная ошибка",
    "unknown_description": "Пожалуйста, попробуйте снова позже.",
    "cancelled": "Отменено"
  }
};
static const Map<String,dynamic> _ky = {
  "buttons": {
    "retry": "Кайра аракет кылуу"
  },
  "general": {
    "language": "Тил",
    "followers": "Жазылуучулар",
    "following": "Жазылгандар",
    "repos": "Репозиторийлер",
    "location": "Жайгашкан жери",
    "company": "Компания",
    "website": "Веб-сайт",
    "joined": "Катталган күнү",
    "users": "Колдонуучулар",
    "settings": "Жөндөөлөр",
    "theme": "Тема",
    "system": "Системалык",
    "light": "Жарык",
    "dark": "Караңгы"
  },
  "language": {
    "ky": "Кыргызча",
    "ru": "Русский",
    "en": "English"
  },
  "errors": {
    "no_internet": "Интернет жок",
    "no_internet_description": "Интернет байланышыңызды текшерип, кайра аракет кылыңыз.",
    "rate_limit": "Суроолордун чеги ашты",
    "rate_limit_description": "Сураныч, бир аздан кийин кайра аракет кылыңыз.",
    "rate_limit_retry_at": "{time} кайра аракет кылыңыз",
    "not_found": "Табылган жок",
    "not_found_description": "Сураныч, бир аздан кийин кайра аракет кылыңыз.",
    "unknown": "Белгисиз ката",
    "unknown_description": "Сураныч, бир аздан кийин кайра аракет кылыңыз.",
    "cancelled": "Жокко чыгарылды"
  }
};
static const Map<String,dynamic> _en = {
  "buttons": {
    "retry": "Try again"
  },
  "general": {
    "language": "Language",
    "followers": "Followers",
    "following": "Following",
    "repos": "Repositories",
    "location": "Location",
    "company": "Company",
    "website": "Website",
    "joined": "Joined GitHub",
    "users": "Users",
    "settings": "Settings",
    "theme": "Theme",
    "system": "System",
    "light": "Light",
    "dark": "Dark"
  },
  "language": {
    "ky": "Кыргызча",
    "ru": "Русский",
    "en": "English"
  },
  "errors": {
    "no_internet": "No internet",
    "no_internet_description": "Please check your internet connection and try again.",
    "rate_limit": "Rate limit exceeded",
    "rate_limit_description": "Please try again later.",
    "rate_limit_retry_at": "Try again at {time}",
    "not_found": "Not found",
    "not_found_description": "Please try again later.",
    "unknown": "Unknown error",
    "unknown_description": "Please try again later.",
    "cancelled": "Cancelled"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": _ru, "ky": _ky, "en": _en};
}
