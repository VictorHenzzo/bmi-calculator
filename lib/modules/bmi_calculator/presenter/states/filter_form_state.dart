import 'package:equatable/equatable.dart';

abstract class FilterFormState extends Equatable {
  const FilterFormState();

  @override
  List<Object?> get props => [];
}

class FilterFormInitialState extends FilterFormState {
  const FilterFormInitialState();

  final canSubmit = false;

  @override
  List<Object?> get props => [];
}

class FilterFormErrorState extends FilterFormState {
  const FilterFormErrorState();

  final message =
      "Ops! Entradas inválidas!\nVerifique os dados e tente novamente";

  @override
  List<Object?> get props => [];
}

class FilterFormValidInput extends FilterFormState {
  const FilterFormValidInput();

  @override
  List<Object?> get props => [];
}
