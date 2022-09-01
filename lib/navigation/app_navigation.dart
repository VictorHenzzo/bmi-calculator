import 'package:bmi_calculator/modules/bmi_calculator/routes/bmi_calculator_route.dart';
import 'package:flutter/material.dart';

class AppNavigation {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case BmiCalculatorRoute.path:
        return BmiCalculatorRoute.of();
      default:
        //TODO: Inserir splash
        return BmiCalculatorRoute.of();
    }
  }
}
