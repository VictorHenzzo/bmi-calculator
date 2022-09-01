import 'package:bmi_calculator/modules/bmi_calculator/ui/presenter/bmi_calculator_presenter.dart';
import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatelessWidget {
  const BmiCalculatorScreen({
    Key? key,
    required this.bmiCalculatorPresenter,
  }) : super(key: key);

  final BmiCalculatorPresenter bmiCalculatorPresenter;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('hi!'),
    );
  }
}
