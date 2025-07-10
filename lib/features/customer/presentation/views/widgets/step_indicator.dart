import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final List<String> titles;
  final int currentStep;
  final Function(int) onStepTapped;

  const StepIndicator({
    super.key,
    required this.titles,
    required this.currentStep,
    required this.onStepTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(titles.length, (index) {
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
                  '${index + 1}. ${titles[index]}',
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.black,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
