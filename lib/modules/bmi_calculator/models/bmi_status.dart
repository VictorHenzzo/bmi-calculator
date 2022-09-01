import 'package:bmi_calculator/modules/bmi_calculator/utils/get_info_from_bmi_index.dart';

class BMIStatus {
  late double bmiIndex;
  late String classification;
  late String healthIssues;

  BMIStatus.fromBmiIndex(this.bmiIndex) {
    Map<String, String> aux = getInfoFromBmiIndex(bmiIndex);

    classification = aux['classification']!;
    healthIssues = aux['healthIssues']!;
  }
}
