import 'package:bmi_calculator/modules/bmi_calculator/ports/input/get_bmi_result_input_port.dart';
import 'package:bmi_calculator/modules/bmi_calculator/presenter/cubits/bmi_calculator_cubit.dart';
import 'package:get_it/get_it.dart';

class BmiCalculatorPresenterFactory {
  static BmiCalculatorCubit make() {
    return BmiCalculatorCubit(
      getBmiResultInputPort: GetIt.I.get<GetBmiResultInputPort>(),
    );
  }
}
