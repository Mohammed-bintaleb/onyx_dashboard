import 'package:flutter/material.dart';

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

  const ProductRowWidget({
    super.key,
    required this.product,
    required this.productDatabase,
    required this.onNameChanged,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final productData = productDatabase[product.name]!;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1D1E33) : Colors.grey[100],
        border: Border.all(color: isDarkMode ? Colors.grey[700]! : Colors.grey),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ProductNameDropdown(
              selectedName: product.name,
              productDatabase: productDatabase,
              onNameChanged: onNameChanged,
              isDarkMode: isDarkMode,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: ProductAvailableText(
              available: productData.available,
              isDarkMode: isDarkMode,
            ),
          ),
          Expanded(
            child: ProductPriceText(
              price: productData.price,
              isDarkMode: isDarkMode,
            ),
          ),
          Expanded(
            child: ProductQuantityInput(
              quantity: product.quantity,
              maxAvailable: productData.available,
              onQuantityChanged: onQuantityChanged,
              isDarkMode: isDarkMode,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: ProductTotalPriceText(
              totalPrice: productData.price * product.quantity,
              isDarkMode: isDarkMode,
            ),
          ),
        ],
      ),
    );
  }
}
