import 'package:bmi_calculator/core/exception/custom_exception.dart';
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
    positiveNumber = 2;
  });

  test('should call get method from output port once and return a BmiStatus',
      () {
    final index = positiveNumber / (positiveNumber * positiveNumber);

    when(() => outputPort.get(index)).thenAnswer((final _) => bmiStatus);

    final result = sut.get(positiveNumber, positiveNumber);

    verify(() => outputPort.get(index)).called(1);
    expect(result, bmiStatus);
  });

  test('should fail when inputs are invalid', () {
    expect(
      () => sut.get(zero, positiveNumber),
      throwsA(isA<CustomException>()),
    );

    expect(
      () => sut.get(positiveNumber, zero),
      throwsA(isA<CustomException>()),
    );

    expect(
      () => sut.get(zero, zero),
      throwsA(isA<CustomException>()),
    );
  });

  test('should return a BmiStatus with a classification: \'Peso normal\'', () {
    double weight = 60;
    double height = 1.7;
    double index = weight / (height * height);
    BmiStatus bmiStatus = BmiStatus(
      bmiIndex: index,
      classification: 'Peso normal',
      healthIssues: 'Menor risco de doenças cardíacas e vasculares',
    );

    //Arrange
    when(() => outputPort.get(index)).thenAnswer((final _) => bmiStatus);

    //Act
    final result = sut.get(weight, height);

    //Assert
    expect(result.bmiIndex, bmiStatus.bmiIndex);
    expect(result.classification, bmiStatus.classification);
    expect(result.healthIssues, bmiStatus.healthIssues);
  });
}

class GetBmiResultOutputPortMock extends Mock
    implements GetBmiResultOutputPort {}

class BmiStatusMock extends Mock implements BmiStatus {}
