import 'package:bmi_calculator/modules/bmi_calculator/domain/bmi_status.dart';

abstract class GetBmiResultInputPort {
  BmiStatus get(double weight, double height);
}
