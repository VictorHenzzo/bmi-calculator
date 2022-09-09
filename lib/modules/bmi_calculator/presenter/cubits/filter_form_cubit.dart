import 'package:bmi_calculator/modules/bmi_calculator/ports/input/filter_form_input_port.dart';
import 'package:bmi_calculator/modules/bmi_calculator/presenter/states/filter_form_state.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ui/presenter/filter_form_presenter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterFormCubit extends Cubit<FilterFormState> with FilterFormPresenter {
  FilterFormCubit({required final filterFormInputPort})
      : _filterFormInputPort = filterFormInputPort,
        super(const FilterFormInitialState());

  final FilterFormInputPort _filterFormInputPort;

  @override
  void check(String? weight, String? height) {
    final entriesAreValid = _filterFormInputPort.check(weight) &&
        _filterFormInputPort.check(height);

    if (entriesAreValid) {
      emit(const FilterFormValidInput());
    } else {
      emit(const FilterFormErrorState());
    }
  }
}
