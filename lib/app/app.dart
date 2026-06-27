import 'package:flutter/material.dart';
import 'package:uas_mobile_lanjut/core/routing/app_router.dart';

class DigiNewsApp extends StatelessWidget {
  const DigiNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DigiNews',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}