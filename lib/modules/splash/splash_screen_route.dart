import 'package:bmi_calculator/modules/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreenRoute {
  static const String path = '/';

  static Route<dynamic> of() {
    return MaterialPageRoute(
      builder: (context) => const SplashScreen(),
    );
  }
}
