import 'package:bmi_calculator/modules/bmi_calculator/domain/bmi_status.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ports/input/get_bmi_result_input_port.dart';
import 'package:bmi_calculator/modules/bmi_calculator/presenter/states/bmi_calculator_state.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ui/presenter/bmi_calculator_presenter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCalculatorCubit extends Cubit<BmiCalculatorState>
    with BmiCalculatorPresenter {
  BmiCalculatorCubit(
      {required final GetBmiResultInputPort getBmiResultInputPort})
      : _getBmiResultInputPort = getBmiResultInputPort,
        super(const BmiCalculatorInitialState());

  final GetBmiResultInputPort _getBmiResultInputPort;

  @override
  BmiStatus calculateBmi({
    required double height,
    required double weigth,
  }) {
    try {
      emit(const BmiCalculatorLoadingState());

      BmiStatus bmiStatus = _getBmiResultInputPort.get(weigth, height);

      //TODO: Criar abstração dos status, uma classe para cada classificação
      emit(const BmiCalculatorResultState());
      return bmiStatus;
    } catch (error) {
      emit(const BmiCalculatorErrorState());

      throw 'error getting results';
    }
  }

  @override
  void resetResults() {
    emit(const BmiCalculatorInitialState());
  }
}
