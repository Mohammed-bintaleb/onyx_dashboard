import 'package:flutter/material.dart';
import '../../models/text_step.dart';

class RectangularStepper extends StatelessWidget {
  final int currentStep;
  final List<TextStep> steps;
  final Function(int) onStepTapped;
  final Function() onStepContinue;
  final Function() onStepCancel;

  const RectangularStepper({
    Key? key,
    required this.currentStep,
    required this.steps,
    required this.onStepTapped,
    required this.onStepContinue,
    required this.onStepCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Step Indicators
        Row(
          children: List.generate(steps.length, (index) {
            final isActive = index == currentStep;
            return Expanded(
              child: InkWell(
                onTap: () => onStepTapped(index),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isActive
                        ? Theme.of(context).primaryColor
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}. ${steps[index].title}',
                      style: TextStyle(
                        color: isActive ? Colors.white : Colors.black,
                        fontWeight: isActive
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 16),
        steps[currentStep].content,
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (currentStep > 0)
              OutlinedButton(
                onPressed: onStepCancel,
                child: const Text('Back'),
              ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: onStepContinue,
              child: Text(currentStep == steps.length - 1 ? 'Submit' : 'Next'),
            ),
          ],
        ),
      ],
    );
  }
}
