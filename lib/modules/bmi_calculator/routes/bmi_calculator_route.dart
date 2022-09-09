import 'package:bmi_calculator/modules/bmi_calculator/presenter/cubits/bmi_calculator_cubit.dart';
import 'package:bmi_calculator/modules/bmi_calculator/presenter/cubits/filter_form_cubit.dart';
import 'package:bmi_calculator/modules/bmi_calculator/presenter/factories/bmi_calculator_presenter_factory.dart';
import 'package:bmi_calculator/modules/bmi_calculator/presenter/factories/filter_form_presenter_factory.dart';
import 'package:bmi_calculator/modules/bmi_calculator/ui/screens/bmi_calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCalculatorRoute {
  static const String path = '/bmi_calculator';

  static Route<dynamic> of() {
    final bmiCalculatorPresenter = BmiCalculatorPresenterFactory.make();
    final filterFormPresenter = FilterFormPresenterFactory.make();

    return MaterialPageRoute(
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider<BmiCalculatorCubit>(
            create: (final _) => bmiCalculatorPresenter,
          ),
          BlocProvider<FilterFormCubit>(
            create: (final _) => filterFormPresenter,
          ),
        ],
        child: BmiCalculatorScreen(
          bmiCalculatorPresenter: bmiCalculatorPresenter,
          filterFormPresenter: filterFormPresenter,
        ),
      ),
    );
  }
}
