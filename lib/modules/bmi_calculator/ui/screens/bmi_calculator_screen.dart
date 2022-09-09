import 'package:bmi_calculator/modules/bmi_calculator/domain/bmi_status.dart';
import 'package:bmi_calculator/modules/bmi_calculator/presenter/cubits/bmi_calculator_cubit.dart';
import 'package:bmi_calculator/modules/bmi_calculator/presenter/cubits/filter_form_cubit.dart';
import 'package:bmi_calculator/modules/bmi_calculator/presenter/states/bmi_calculator_state.dart';
import 'package:bmi_calculator/modules/bmi_calculator/presenter/states/filter_form_state.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ui/components/custom_form_field.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ui/presenter/bmi_calculator_presenter.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ui/presenter/filter_form_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCalculatorScreen extends StatelessWidget {
  BmiCalculatorScreen({
    Key? key,
    required this.bmiCalculatorPresenter,
    required this.filterFormPresenter,
  }) : super(key: key);

  final BmiCalculatorPresenter bmiCalculatorPresenter;
  final FilterFormPresenter filterFormPresenter;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      body: _renderWidgetByState(),
    ));
  }

  BlocBuilder<BmiCalculatorCubit, BmiCalculatorState> _renderWidgetByState() {
    return BlocBuilder<BmiCalculatorCubit, BmiCalculatorState>(
        builder: (final context, final state) {
      switch (state.runtimeType) {
        case BmiCalculatorInitialState:
          return _buildForm();
        case BmiCalculatorLoadingState:
          return const CircularProgressIndicator();
        case BmiCalculatorResultState:
          if (state is BmiCalculatorResultState) {
            return _buildResult(state.bmiStatus);
          }
          return const SizedBox();
        case BmiCalculatorErrorState:
          if (state is BmiCalculatorErrorState) {
            return _buildError(state.error);
          }
      }

      return const SizedBox();
    });
  }

  //TODO: Remover?
  Center _buildError(String errorMessage) {
    return Center(
      child: Column(
        children: [
          const Text('Ops! :('),
          Text(errorMessage),
          ElevatedButton(
            onPressed: bmiCalculatorPresenter.resetResults,
            child: const Text('Refazer'),
          )
        ],
      ),
    );
  }

  //TODO: Isso ta certo? Reconstroí tudo... apesar de tudo se apenas o formulário
  BlocBuilder<FilterFormCubit, FilterFormState> _buildForm() {
    return BlocBuilder<FilterFormCubit, FilterFormState>(
        builder: (final context, final state) {
      switch (state.runtimeType) {
        case FilterFormInitialState:
          return _formBody(false, '');
        case FilterFormErrorState:
          if (state is FilterFormErrorState) {
            return _formBody(false, state.message);
          }
          return const SizedBox();
        case FilterFormValidInput:
          return _formBody(true, '');
      }

      return const SizedBox();
    });
  }

  Widget _formBody(bool entriesAreValid, String message) {
    return Column(
      children: [
        const Spacer(flex: 1),
        const Text(
          'Insira seus dados abaixo',
          style: TextStyle(fontSize: 30),
        ),
        const Spacer(flex: 1),
        Text(message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.red,
            )),
        Form(
            key: _formKey,
            onChanged: () {
              filterFormPresenter.check(
                weightController.text,
                heightController.text,
              );
            },
            child: Column(
              children: [
                CustomFormField(
                  labelText: 'Peso (kg)',
                  icon: const Icon(Icons.balance),
                  controller: weightController,
                ),
                CustomFormField(
                  labelText: 'Altura (m)',
                  icon: const Icon(Icons.height),
                  controller: heightController,
                ),
              ],
            )),
        const Spacer(flex: 1),
        ElevatedButton(
          onPressed: entriesAreValid
              ? () {
                  bmiCalculatorPresenter.calculateBmi(
                    height: double.parse(heightController.text),
                    weigth: double.parse(weightController.text),
                  );
                }
              : null,
          child: const Text('Calcular'),
        ),
        const Spacer(flex: 5),
      ],
    );
  }

  Widget _buildResult(BmiStatus result) {
    return Center(
      child: Column(
        children: [
          Text(result.bmiIndex.toStringAsFixed(2)),
          Text(result.classification.toString()),
          Text(result.healthIssues.toString()),
          ElevatedButton(
            onPressed: bmiCalculatorPresenter.resetResults,
            child: const Text('Refazer'),
          ),
        ],
      ),
    );
  }
}
