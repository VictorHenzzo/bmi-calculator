import 'package:bmi_calculator/modules/bmi_calculator/data/datasource/get_bmi_result_datasource.dart';
import 'package:bmi_calculator/modules/bmi_calculator/domain/bmi_status.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ports/output/get_bmi_result_output_port.dart';

class GetBmiResultRepository implements GetBmiResultOutputPort {
  @override
  BmiStatus get(double weight, double height) {
    return BmiStatus.fromMap(getBmiResultDatasource(
      weight,
      height,
    ));
  }
}
