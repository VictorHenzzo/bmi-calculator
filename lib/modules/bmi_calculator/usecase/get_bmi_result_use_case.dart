// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    return _outputPort.get(weight, height);
  }
}
