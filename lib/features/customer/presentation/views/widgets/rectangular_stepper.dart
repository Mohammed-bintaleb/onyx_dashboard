import 'package:flutter/material.dart';
import 'step_indicator.dart';

class RectangularStepper extends StatelessWidget {
  final List<String> stepTitles;
  final int currentStep;
  final Function(int) onStepTapped;

  const RectangularStepper({
    super.key,
    required this.stepTitles,
    required this.currentStep,
    required this.onStepTapped,
  });

  @override
  Widget build(BuildContext context) {
    return StepIndicator(
      titles: stepTitles,
      currentStep: currentStep,
      onStepTapped: onStepTapped,
    );
  }
}
