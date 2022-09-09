import 'package:bmi_calculator/modules/bmi_calculator/data/datasource/get_bmi_result_datasource.dart';
import 'package:bmi_calculator/modules/bmi_calculator/domain/bmi_status.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ports/output/get_bmi_result_output_port.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetBmiResultOutputPort)
class GetBmiResultRepository implements GetBmiResultOutputPort {
  @override
  BmiStatus get(double bmiIndex) {
    return BmiStatus.fromMap(getBmiResultDatasource(bmiIndex));
  }
}
