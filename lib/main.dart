import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timbu_peek/theme_controller.dart';
import 'package:timbu_peek/utils/app_theme.dart';
import 'package:timbu_peek/views/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeSwitchController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Timbu Peek',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeSwitchController.theme,
        home: SplashScreen(),
      );
    });
  }
}
