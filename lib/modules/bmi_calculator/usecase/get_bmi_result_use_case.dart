import 'package:bmi_calculator/core/exception/custom_exception.dart';
import 'package:bmi_calculator/modules/bmi_calculator/domain/bmi_status.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ports/input/get_bmi_result_input_port.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ports/output/get_bmi_result_output_port.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetBmiResultInputPort)
class GetBmiResultUseCase implements GetBmiResultInputPort {
  GetBmiResultUseCase(this._outputPort);

  final GetBmiResultOutputPort _outputPort;

  @override
  BmiStatus get(double weight, double height) {
    if (weight <= 0 || height <= 0) {
      throw CustomException('Entradas inválidas!');
    }

    double bmiIndex = weight / (height * height);
    return _outputPort.get(bmiIndex);
  }
}
