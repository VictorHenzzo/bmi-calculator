import 'package:bmi_calculator/modules/bmi_calculator/ports/input/filter_form_input_port.dart';
import 'package:bmi_calculator/core/extensions/string_extensions.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FilterFormInputPort)
class FilterFormUseCase implements FilterFormInputPort {
  @override
  bool check(String? message) {
    if (message.isNullOrEmpty()) {
      return false;
    }

    return !(message!.contains(RegExp('[^0-9.]')));
  }
}
