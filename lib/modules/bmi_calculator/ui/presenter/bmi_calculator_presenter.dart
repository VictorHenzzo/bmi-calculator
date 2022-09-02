import 'package:bmi_calculator/modules/bmi_calculator/domain/bmi_status.dart';

mixin BmiCalculatorPresenter {
  BmiStatus calculateBmi({
    required double height,
    required double weigth,
  });

  void resetResults() {}
}
