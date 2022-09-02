import 'package:bmi_calculator/modules/bmi_calculator/data/repository/get_bmi_result_repository.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ports/input/get_bmi_result_input_port.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ports/output/get_bmi_result_output_port.dart';
import 'package:bmi_calculator/modules/bmi_calculator/presenter/cubits/bmi_calculator_cubit.dart';
import 'package:bmi_calculator/modules/bmi_calculator/usecase/get_bmi_result_use_case.dart';

class BmiCalculatorPresenterFactory {
  static BmiCalculatorCubit make() {
    return BmiCalculatorCubit(
      //TODO: Adicionar injeção de dependências
      getBmiResultInputPort: GetBmiResultUseCase(GetBmiResultRepository()),
    );
  }
}
