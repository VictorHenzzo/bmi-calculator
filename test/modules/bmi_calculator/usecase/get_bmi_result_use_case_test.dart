import 'dart:ffi';

import 'package:bmi_calculator/modules/bmi_calculator/domain/bmi_status.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ports/input/get_bmi_result_input_port.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ports/output/get_bmi_result_output_port.dart';
import 'package:bmi_calculator/modules/bmi_calculator/usecase/get_bmi_result_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late GetBmiResultOutputPort outputPort;
  late GetBmiResultInputPort sut;
  late BmiStatus bmiStatus;
  late double zero;
  late double positiveNumber;

  setUp(() {
    outputPort = GetBmiResultOutputPortMock();
    sut = GetBmiResultUseCase(outputPort);
    bmiStatus = BmiStatusMock();
    zero = 0;
    positiveNumber = 1;
  });

  test('should call get method from output port', () {
    when(() => outputPort.get(positiveNumber, positiveNumber))
        .thenAnswer((final _) => bmiStatus);

    expect(sut.get(positiveNumber, positiveNumber), bmiStatus);
  });

  test('should fail when inputs are invalid', () {
    when(() => outputPort.get(positiveNumber, zero)).thenThrow(Exception);

    expect(sut.get(positiveNumber, zero), Exception);
  });

  //TODO: Incluir testes com valores "reais"
}

class GetBmiResultOutputPortMock extends Mock
    implements GetBmiResultOutputPort {}

class BmiStatusMock extends Mock implements BmiStatus {}
