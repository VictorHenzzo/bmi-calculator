import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/bmi_calculator');
    });

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
          child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.secondary,
              blurRadius: 50,
            )
          ],
          color: Theme.of(context).colorScheme.onBackground,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Icon(
            Icons.health_and_safety_outlined,
            color: Theme.of(context).colorScheme.primary,
            size: 150,
          ),
        ),
      )),
    );
  }
}
