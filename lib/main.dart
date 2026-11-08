import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_users/app/app.dart';
import 'package:github_users/app/localization/app_localization.dart';
import 'package:github_users/core/di/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await EasyLocalization.ensureInitialized();
  await setupDi();
  runApp(AppLocalization(child: const App()));
}
