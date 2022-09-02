import 'package:bmi_calculator/modules/bmi_calculator/routes/bmi_calculator_route.dart';
import 'package:bmi_calculator/navigation/app_navigation.dart';
import 'package:bmi_calculator/service_locator/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: BmiCalculatorRoute.path,
      onGenerateRoute: AppNavigation.generateRoute,
    );
  }
}
