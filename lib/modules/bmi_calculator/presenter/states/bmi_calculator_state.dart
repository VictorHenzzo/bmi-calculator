import 'package:equatable/equatable.dart';

abstract class BmiCalculatorState extends Equatable {
  const BmiCalculatorState();

  @override
  List<Object?> get props => [];
}

class BmiCalculatorInitialState extends BmiCalculatorState {
  const BmiCalculatorInitialState();

  @override
  List<Object?> get props => [];
}

class BmiCalculatorResultState extends BmiCalculatorState {
  const BmiCalculatorResultState();

  @override
  List<Object?> get props => [];
}

class BmiCalculatorLoadingState extends BmiCalculatorState {
  const BmiCalculatorLoadingState();

  @override
  List<Object?> get props => [];
}

class BmiCalculatorErrorState extends BmiCalculatorState {
  const BmiCalculatorErrorState();

  @override
  List<Object?> get props => [];
}
