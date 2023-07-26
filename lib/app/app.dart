import 'package:corewave_app_task/presentation/resources/routes_manager.dart';
import 'package:corewave_app_task/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.route,
      initialRoute: RouteManager.homeRoute,
      theme: appThemeManager(),
    );
  }
}
