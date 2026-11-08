import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:github_users/app/router/app_router.dart';
import 'package:github_users/core/constants/app_const.dart';

@RoutePage(name: "SplashRoute")
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static const _duration = Duration(seconds: 3);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(_duration, _goToUsers);
  }

  void _goToUsers() {
    if (!mounted) return;
    context.router.replace(const UsersListRoute());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AppConst.logoPngPath, width: 140)),
    );
  }
}
