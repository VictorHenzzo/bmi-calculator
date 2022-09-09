import 'package:bmi_calculator/modules/bmi_calculator/ports/input/filter_form_input_port.dart';
import 'package:bmi_calculator/modules/bmi_calculator/presenter/cubits/filter_form_cubit.dart';
import 'package:get_it/get_it.dart';

class FilterFormPresenterFactory {
  static FilterFormCubit make() {
    return FilterFormCubit(
      filterFormInputPort: GetIt.I.get<FilterFormInputPort>(),
    );
  }
}
