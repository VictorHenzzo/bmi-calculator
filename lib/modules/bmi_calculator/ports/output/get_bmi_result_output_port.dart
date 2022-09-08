import 'package:bmi_calculator/modules/bmi_calculator/domain/bmi_status.dart';

abstract class GetBmiResultOutputPort {
  BmiStatus get(double bmiIndex);
}
