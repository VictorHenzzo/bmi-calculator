import 'package:bmi_calculator/modules/bmi_calculator/usecase/filter_form_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FilterFormUseCase sut;

  setUp(() {
    sut = FilterFormUseCase();
  });

  test('should return false due empty inputs', () {
    const String? nullString = null;
    const String? emptyString = '';

    expect(sut.check(nullString), false);
    expect(sut.check(emptyString), false);
  });

  test('should return true due valid inputs', () {
    final numbers = sut.check('1234567890');
    final doubleExample = sut.check('3.1415');

    expect(numbers, true);
    expect(doubleExample, true);
  });

  test('should return false due invalid inputs', () {
    final letters =
        sut.check('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ');
    final symbols = sut.check('!@#\$%¨&*()-_=+§´`[]{}[ªº/?~^;:><,.\\|');
    final invalidDouble = sut.check('3,14');

    expect(letters, false);
    expect(symbols, false);
    expect(invalidDouble, false);
  });
}
