import 'package:flutter/material.dart';

import '../../../../../core/widgets/chart_custom_container.dart';
import '../../../domain/Entities/product_row_entity.dart';
import 'review_step.dart';

class ReviewStepSection extends StatelessWidget {
  final Map<String, dynamic> formData;
  final List<ProductRowEntity> products;
  final double grandTotal;
  final VoidCallback onBack;
  final VoidCallback onSubmit;
  final Color textColor;

  const ReviewStepSection({
    required this.formData,
    required this.products,
    required this.grandTotal,
    required this.onBack,
    required this.onSubmit,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChartCustomContainer(
          title: "Review Order",
          subtitle: "Review the details below and submit the order.",
          child: ReviewStep(
            formData: formData,
            products: products,
            grandTotal: grandTotal,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: onBack,
              style: OutlinedButton.styleFrom(foregroundColor: textColor),
              child: const Text("Back"),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: onSubmit,
              child: const Text("Create Order"),
            ),
          ],
        ),
      ],
    );
  }
}
