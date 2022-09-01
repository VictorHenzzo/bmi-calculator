import 'package:bmi_calculator/modules/bmi_calculator/models/bmi_status.dart';
import 'package:bmi_calculator/modules/bmi_calculator/presenter/states/bmi_calculator_state.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ui/presenter/bmi_calculator_presenter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCalculatorCubit extends Cubit<BmiCalculatorState>
    with BmiCalculatorPresenter {
  BmiCalculatorCubit() : super(const BmiCalculatorInitialState());

  @override
  BMIStatus calculateBmi({
    required double height,
    required double weigth,
  }) {
    late BMIStatus bmiStatus;
    emit(const BmiCalculatorLoadingState());

    try {
      double userBmi = weigth / (height * height);
      bmiStatus = BMIStatus.fromBmiIndex(userBmi);

      emit(const BmiCalculatorResultState());
    } catch (error) {
      emit(const BmiCalculatorErrorState());
    }

    return bmiStatus;
  }

  @override
  void resetResults() {
    emit(const BmiCalculatorInitialState());
  }
}
