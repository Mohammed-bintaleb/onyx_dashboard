import 'package:flutter/material.dart';

import 'rectangular_stepper.dart';

class StepperSection extends StatelessWidget {
  final Color containerColor;
  final List<String> stepTitles;
  final int currentStep;
  final void Function(int) onStepTapped;

  const StepperSection({
    super.key,
    required this.containerColor,
    required this.stepTitles,
    required this.currentStep,
    required this.onStepTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(5),
      child: RectangularStepper(
        stepTitles: stepTitles,
        currentStep: currentStep,
        onStepTapped: onStepTapped,
      ),
    );
  }
}
