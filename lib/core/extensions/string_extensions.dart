// ignore_for_file: unnecessary_null_comparison
// ignore_for_file: unnecessary_this

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}
