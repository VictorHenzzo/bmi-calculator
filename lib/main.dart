import 'package:bmi_calculator/modules/bmi_calculator/data/repository/get_bmi_result_repository.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ports/input/get_bmi_result_input_port.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ports/output/get_bmi_result_output_port.dart';
import 'package:bmi_calculator/modules/bmi_calculator/routes/bmi_calculator_route.dart';
import 'package:bmi_calculator/modules/bmi_calculator/usecase/get_bmi_result_use_case.dart';
import 'package:bmi_calculator/navigation/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<GetBmiResultOutputPort>(GetBmiResultRepository());
  getIt.registerSingleton<GetBmiResultInputPort>(GetBmiResultUseCase(
    getIt<GetBmiResultOutputPort>(),
  ));

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
