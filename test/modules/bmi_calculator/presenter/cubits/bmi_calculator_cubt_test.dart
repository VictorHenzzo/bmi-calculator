import 'package:bloc_test/bloc_test.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ports/input/get_bmi_result_input_port.dart';
import 'package:bmi_calculator/modules/bmi_calculator/presenter/cubits/bmi_calculator_cubit.dart';
import 'package:bmi_calculator/modules/bmi_calculator/presenter/states/bmi_calculator_state.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ui/screens/bmi_calculator_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late BmiCalculatorCubit sut;
  late GetBmiResultInputPort getBmiResultInputPort;

  setUp(() {
    getBmiResultInputPort = GetBmiResultInputPortMock();
    sut = BmiCalculatorCubit(getBmiResultInputPort: getBmiResultInputPort);
  });

  blocTest<BmiCalculatorCubit, BmiCalculatorState>(
    'should have a initial state',
    build: () => sut,
    verify: (final cubit) =>
        expect(cubit.state, const BmiCalculatorInitialState()),
  );
}

class GetBmiResultInputPortMock extends Mock implements GetBmiResultInputPort {}
