import 'package:flutter/material.dart';
import '../../../../../core/utils/app_localizations.dart';
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
    super.key,
    required this.formData,
    required this.products,
    required this.grandTotal,
    required this.onBack,
    required this.onSubmit,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChartCustomContainer(
          title: t.translate("review_order"),
          subtitle: t.translate("review_details_submit"),
          child: ReviewStep(
            formData: formData,
            products: products,
            grandTotal: grandTotal,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            OutlinedButton(
              onPressed: onBack,
              style: OutlinedButton.styleFrom(foregroundColor: textColor),
              child: Text(t.translate("back")),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: onSubmit,
              child: Text(t.translate("create_order")),
            ),
          ],
        ),
      ],
    );
  }
}
