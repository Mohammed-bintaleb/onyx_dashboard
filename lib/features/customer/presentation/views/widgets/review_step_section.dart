import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_localizations.dart';
import '../../../../../core/widgets/chart_custom_container.dart';
import '../../../domain/Entities/product_row_entity.dart';
import '../../manger/order_cubit/order_cubit.dart';
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
          children: [
            OutlinedButton(
              onPressed: onBack,
              style: OutlinedButton.styleFrom(foregroundColor: textColor),
              child: Text(t.translate("back")),
            ),
            const Spacer(),
            BlocBuilder<OrderCubit, OrderState>(
              builder: (context, state) {
                final isSaving = state is OrderSaving;

                return ElevatedButton(
                  onPressed: isSaving
                      ? null
                      : () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text(t.translate("confirm")),
                              content: Text(
                                t.translate("are_you_sure_submit_order"),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(ctx).pop(),
                                  child: Text(t.translate("cancel")),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                    onSubmit(); //* هذا يستدعي submitForm
                                  },
                                  child: Text(t.translate("yes_submit")),
                                ),
                              ],
                            ),
                          );
                        },
                  child: isSaving
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(t.translate("create_order")),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
