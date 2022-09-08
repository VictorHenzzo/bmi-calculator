// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../modules/bmi_calculator/data/repository/get_bmi_result_repository.dart'
    as _i4;
import '../../modules/bmi_calculator/ports/input/get_bmi_result_input_port.dart'
    as _i5;
import '../../modules/bmi_calculator/ports/output/get_bmi_result_output_port.dart'
    as _i3;
import '../../modules/bmi_calculator/usecase/get_bmi_result_use_case.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.GetBmiResultOutputPort>(() => _i4.GetBmiResultRepository());
  gh.factory<_i5.GetBmiResultInputPort>(
      () => _i6.GetBmiResultUseCase(get<_i3.GetBmiResultOutputPort>()));
  return get;
}
