Map<String, String> getBmiResultDatasource(double weight, double height) {
  //TODO: Alterar cálculo para a usecase
  double bmiIndex = weight / (height * height);
  String classification;
  String healthIssues;

  if (bmiIndex < 18.5) {
    classification = 'Magreza';
    healthIssues = 'Fadiga, stress, ansiedade';
  } else if (bmiIndex < 24.9) {
    classification = 'Peso normal';
    healthIssues = 'Menor risco de doenças cardíacas e vasculares';
  } else if (bmiIndex < 29.9) {
    classification = 'Sobrepeso';
    healthIssues = 'Fadiga, má circulação, varizes';
  } else if (bmiIndex < 34.9) {
    classification = 'Obesidade grau I';
    healthIssues = 'Diabetes, angina, infarto, aterosclerose';
  } else if (bmiIndex < 40) {
    classification = 'Obesidade grau II';
    healthIssues = 'Apneia do sono, falta de ar';
  } else {
    classification = 'Obesidade grau III';
    healthIssues =
        'Refluxo, dificuldade para se mover, escaras, diabetes, infarto, AVC';
  }

  return {
    'bmiIndex': bmiIndex.toString(),
    'classification': classification,
    'healthIssues': healthIssues,
  };
}
