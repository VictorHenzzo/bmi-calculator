import 'package:bmi_calculator/modules/bmi_calculator/models/bmi_status.dart';

mixin BmiCalculatorPresenter {
  BMIStatus calculateBmi({
    required double height,
    required double weigth,
  });
}
