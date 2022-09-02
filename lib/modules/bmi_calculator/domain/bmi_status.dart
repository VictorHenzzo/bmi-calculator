// ignore_for_file: public_member_api_docs, sort_constructors_first
class BmiStatus {
  final double bmiIndex;
  final String classification;
  final String healthIssues;

  BmiStatus({
    required this.bmiIndex,
    required this.classification,
    required this.healthIssues,
  });

  factory BmiStatus.fromMap(Map<String, String> map) {
    return BmiStatus(
      bmiIndex: double.parse(map['bmiIndex']!),
      classification: map['classification']!,
      healthIssues: map['healthIssues']!,
    );
  }
}
