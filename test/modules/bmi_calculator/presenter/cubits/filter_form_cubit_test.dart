import 'package:bloc_test/bloc_test.dart';
import 'package:bmi_calculator/core/exception/custom_exception.dart';
import 'package:bmi_calculator/modules/bmi_calculator/domain/bmi_status.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ports/input/filter_form_input_port.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ports/input/get_bmi_result_input_port.dart';
import 'package:bmi_calculator/modules/bmi_calculator/presenter/cubits/bmi_calculator_cubit.dart';
import 'package:bmi_calculator/modules/bmi_calculator/presenter/cubits/filter_form_cubit.dart';
import 'package:bmi_calculator/modules/bmi_calculator/presenter/states/bmi_calculator_state.dart';
import 'package:bmi_calculator/modules/bmi_calculator/presenter/states/filter_form_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late FilterFormCubit sut;
  late FilterFormInputPort filterFormInputPort;

  setUp(() {
    filterFormInputPort = FilterFormInputPortMock();
    sut = FilterFormCubit(filterFormInputPort: filterFormInputPort);
  });

  blocTest<FilterFormCubit, FilterFormState>(
    'should have a initial state',
    build: () => sut,
    verify: (final cubit) =>
        expect(cubit.state, const FilterFormInitialState()),
  );

  blocTest<FilterFormCubit, FilterFormState>(
    'should call check from use case once then emit a FilterFormErrorState',
    build: () => sut,
    act: (final cubit) {
      when(() => filterFormInputPort.check('')).thenReturn(false);

      cubit.check('', '');
    },
    expect: () {
      verify(() => filterFormInputPort.check('')).called(1);
      return equals([
        const FilterFormErrorState(),
      ]);
    },
  );

  blocTest<FilterFormCubit, FilterFormState>(
    'should call check from use case twice then emit a FilterFormValidInput',
    build: () => sut,
    act: (final cubit) {
      when(() => filterFormInputPort.check('123')).thenReturn(true);

      cubit.check('123', '123');
    },
    expect: () {
      verify(() => filterFormInputPort.check('123')).called(2);
      return equals([
        const FilterFormValidInput(),
      ]);
    },
  );
}

class FilterFormInputPortMock extends Mock implements FilterFormInputPort {}
