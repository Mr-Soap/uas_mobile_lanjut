import 'package:flutter/material.dart';
import 'package:uas_mobile_lanjut/core/routing/app_router.dart';
import 'package:uas_mobile_lanjut/core/config/env/environment_config.dart';

class DigiNewsApp extends StatelessWidget {
  const DigiNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: EnvironmentConfig.config.appName,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}