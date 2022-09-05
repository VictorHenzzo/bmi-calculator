import 'package:bmi_calculator/modules/bmi_calculator/routes/bmi_calculator_route.dart';
import 'package:bmi_calculator/modules/splash/splash_screen_route.dart';
import 'package:flutter/material.dart';

class AppNavigation {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreenRoute.path:
        return SplashScreenRoute.of();
      case BmiCalculatorRoute.path:
        return BmiCalculatorRoute.of();

      default:
        return SplashScreenRoute.of();
    }
  }
}
