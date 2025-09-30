import 'package:challenge_app/core/helper/custom_scroll_behavior.dart';
import 'package:challenge_app/core/routing/app_router.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChallengeApp());
}

class ChallengeApp extends StatelessWidget {
  const ChallengeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      enabled: !kReleaseMode && true,
      builder: (context) => MaterialApp.router(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        title: 'Challenge App',
        routerConfig: AppRouter.router,
        builder: DevicePreview.appBuilder,
        scrollBehavior: CustomScrollBehavior(),
        locale: const Locale('en'),
        themeMode: ThemeMode.light,
        theme: ThemeData(fontFamily: 'Raleway'),
      ),
    );
  }
}
