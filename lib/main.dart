import 'package:bmi_calculator/core/navigation/app_navigation.dart';
import 'package:bmi_calculator/core/service_locator/service_locator.dart';
import 'package:bmi_calculator/modules/splash/splash_screen_route.dart';
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
        colorScheme: const ColorScheme(
          background: Color(0xff313131),
          onBackground: Color(0xff4a4a4f),
          secondary: Color(0xff9ff0bf),
          primary: Color(0xff597fba),
          brightness: Brightness.light,
          error: Color(0xfff75454),
          onError: Color(0xfff75454),
          onPrimary: Color(0xff9ff0bf),
          onSecondary: Color(0xff597fba),
          onSurface: Color(0xff313131),
          surface: Color(0xffFFFFFF),
        ),
      ),
      initialRoute: SplashScreenRoute.path,
      onGenerateRoute: AppNavigation.generateRoute,
    );
  }
}
