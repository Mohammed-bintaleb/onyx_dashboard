import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../core/widgets/chart_custom_container.dart';
import '../../../domain/Entities/product_row_entity.dart';
import 'add_products.dart';
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
    // final theme = Theme.of(context);
    // final isDarkMode = theme.brightness == Brightness.dark;
    // final containerColor = isDarkMode ? Color(0xFF1D1E33) : Colors.grey[300];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChartCustomContainer(
          title: "Customer Details",
          subtitle: "Enter the customer's information for the new order.",
          child: CustomerDetailsForm(formKey: formKey),
        ),
        const SizedBox(height: 25),
        ChartCustomContainer(
          title: "Add Products",
          subtitle: "Search for products and add them to the order.",
          child: ProductTable(
            onContinue: onContinue,
            onProductsUpdated: onProductsUpdated,
          ),
        ),
      ],
    );
  }
}
