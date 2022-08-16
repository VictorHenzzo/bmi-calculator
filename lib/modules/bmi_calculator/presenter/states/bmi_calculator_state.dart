import 'package:equatable/equatable.dart';

abstract class BMICalculatorState extends Equatable {
  const BMICalculatorState();

  @override
  List<Object?> get props => [];
}

class BMICalculatorIniticalState extends BMICalculatorState {
  const BMICalculatorIniticalState();

  @override
  List<Object?> get props => [];
}

class BMICalculatorResultState extends BMICalculatorState {
  const BMICalculatorResultState();

  @override
  List<Object?> get props => [];
}

class BMICalculatorErrorState extends BMICalculatorState {
  const BMICalculatorErrorState();

  @override
  List<Object?> get props => [];
}
