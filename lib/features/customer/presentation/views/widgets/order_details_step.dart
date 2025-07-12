import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../core/utils/app_localizations.dart';
import '../../../../../core/widgets/chart_custom_container.dart';
import '../../../domain/Entities/product_row_entity.dart';
import 'add_products_row.dart';
import 'customer_details_form.dart';

class OrderDetailsStep extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final VoidCallback onContinue;
  final void Function(List<ProductRowEntity>, double) onProductsUpdated;

  const OrderDetailsStep({
    super.key,
    required this.formKey,
    required this.onContinue,
    required this.onProductsUpdated,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChartCustomContainer(
          title: t.translate("customer_details_title"),
          subtitle: t.translate("customer_details_subtitle"),
          child: CustomerDetailsForm(formKey: formKey),
        ),
        const SizedBox(height: 25),
        ChartCustomContainer(
          title: t.translate("add_products_title"),
          subtitle: t.translate("add_products_subtitle"),
          child: AddProductsRow(
            onContinue: onContinue,
            onProductsUpdated: onProductsUpdated,
          ),
        ),
      ],
    );
  }
}
