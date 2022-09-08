import 'package:bloc_test/bloc_test.dart';
import 'package:bmi_calculator/core/exception/custom_exception.dart';
import 'package:bmi_calculator/modules/bmi_calculator/domain/bmi_status.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ports/input/get_bmi_result_input_port.dart';
import 'package:bmi_calculator/modules/bmi_calculator/presenter/cubits/bmi_calculator_cubit.dart';
import 'package:bmi_calculator/modules/bmi_calculator/presenter/states/bmi_calculator_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late BmiCalculatorCubit sut;
  late GetBmiResultInputPort getBmiResultInputPort;
  late BmiStatus bmiStatusResult;
  late CustomException exception;

  setUp(() {
    getBmiResultInputPort = GetBmiResultInputPortMock();
    sut = BmiCalculatorCubit(getBmiResultInputPort: getBmiResultInputPort);
    bmiStatusResult = BmiStatusMock();
    exception = CustomException('Entradas inválidas!');
  });

  blocTest<BmiCalculatorCubit, BmiCalculatorState>(
    'should have a initial state',
    build: () => sut,
    verify: (final cubit) =>
        expect(cubit.state, const BmiCalculatorInitialState()),
  );

  blocTest<BmiCalculatorCubit, BmiCalculatorState>(
    'should call get from user case once, emit a loading state and then a result state',
    build: () => sut,
    act: (final cubit) {
      when(() => getBmiResultInputPort.get(60, 1.7))
          .thenReturn(bmiStatusResult);

      cubit.calculateBmi(
        weigth: 60,
        height: 1.7,
      );
    },
    expect: () {
      verify(() => getBmiResultInputPort.get(60, 1.7)).called(1);
      return equals([
        const BmiCalculatorLoadingState(),
        BmiCalculatorResultState(bmiStatusResult),
      ]);
    },
  );

  blocTest<BmiCalculatorCubit, BmiCalculatorState>(
    'should call get from user case once, emit a loading state and then a error state',
    build: () => sut,
    act: (final cubit) {
      when(() => getBmiResultInputPort.get(0, 1.7)).thenThrow(exception);

      cubit.calculateBmi(
        weigth: 0,
        height: 1.7,
      );
    },
    expect: () {
      verify(() => getBmiResultInputPort.get(0, 1.7)).called(1);
      return equals([
        const BmiCalculatorLoadingState(),
        BmiCalculatorErrorState(exception.message),
      ]);
    },
  );
}

class GetBmiResultInputPortMock extends Mock implements GetBmiResultInputPort {}

class BmiStatusMock extends Mock implements BmiStatus {}
