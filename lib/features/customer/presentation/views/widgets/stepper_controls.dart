import 'package:flutter/material.dart';

class StepperControls extends StatelessWidget {
  final VoidCallback? onStepContinue;
  final VoidCallback? onStepCancel;
  final bool isLastStep;

  const StepperControls({
    super.key,
    this.onStepContinue,
    this.onStepCancel,
    this.isLastStep = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          if (onStepCancel != null)
            ElevatedButton(onPressed: onStepCancel, child: const Text('Back')),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: onStepContinue,
            child: Text(isLastStep ? 'Submit' : 'Continue'),
          ),
        ],
      ),
    );
  }
}
