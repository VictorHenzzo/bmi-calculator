import 'package:bmi_calculator/modules/bmi_calculator/domain/bmi_status.dart';
import 'package:flutter/material.dart';

class BuildResultPage extends StatelessWidget {
  const BuildResultPage({
    Key? key,
    required this.result,
    required this.callback,
  }) : super(key: key);

  final BmiStatus result;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(result.bmiIndex.toStringAsFixed(2)),
          Text(result.classification.toString()),
          Text(result.healthIssues.toString()),
          ElevatedButton(
            onPressed: (() => callback()),
            child: const Text('Refazer'),
          ),
        ],
      ),
    );
  }
}
