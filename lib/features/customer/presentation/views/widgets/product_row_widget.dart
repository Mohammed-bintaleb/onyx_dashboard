import 'package:flutter/material.dart';
import 'package:onyx_dashboard/core/extensions/context_extensions.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../domain/Entities/product_data_entity.dart';
import '../../../domain/Entities/product_row_entity.dart';
import 'product_available_text.dart';
import 'product_name_dropdown.dart';
import 'product_price_text.dart';
import 'product_quantity_input.dart';
import 'product_total_price_text.dart';

class ProductRowWidget extends StatelessWidget {
  final ProductRowEntity product;
  final Map<String, ProductDataEntity> productDatabase;
  final Function(String) onNameChanged;
  final Function(int) onQuantityChanged;
  final VoidCallback onDelete;

  const ProductRowWidget({
    super.key,
    required this.product,
    required this.productDatabase,
    required this.onNameChanged,
    required this.onQuantityChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final productData = productDatabase[product.name]!;

    final backgroundColor = isDark
        ? AppColors.darkBackground
        : AppColors.grey100;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ProductNameDropdown(
              selectedName: product.name,
              productDatabase: productDatabase,
              onNameChanged: onNameChanged,
              isDarkMode: isDark,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: ProductAvailableText(
              available: productData.available,
              isDarkMode: isDark,
            ),
          ),
          Expanded(
            child: ProductPriceText(
              price: productData.price,
              isDarkMode: isDark,
            ),
          ),
          Expanded(
            child: ProductQuantityInput(
              quantity: product.quantity,
              maxAvailable: productData.available,
              onQuantityChanged: onQuantityChanged,
              isDarkMode: isDark,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: ProductTotalPriceText(
              totalPrice: productData.price * product.quantity,
              isDarkMode: isDark,
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: onDelete,
            tooltip: 'Delete Product',
          ),
        ],
      ),
    );
  }
}
