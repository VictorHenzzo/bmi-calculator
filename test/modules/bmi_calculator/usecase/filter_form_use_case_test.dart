import 'package:bmi_calculator/modules/bmi_calculator/usecase/filter_form_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late FilterFormUseCase sut;

  setUp(() {
    sut = FilterFormUseCase();
  });

  test('should return a empty string', () {
    const String? nullString = null;
    const String? emptyString = '';

    expect(sut.check(nullString), '');
    expect(sut.check(emptyString), '');
  });

  test('should filter all characters but numbers and dots', () {
    final numbers = sut.check('1234567890');
    final letters =
        sut.check('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ');
    final symbols = sut.check('!@#\$%¨&*()-_=+§´`[]{}[ªº/?~^;:><,.\\|');

    expect(numbers, '1234567890');
    expect(letters, '');
    expect(symbols, '.');
  });
}
