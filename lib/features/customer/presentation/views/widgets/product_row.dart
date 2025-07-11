import 'package:flutter/material.dart';

import '../../../data/models/product_data.dart';
import '../../../data/models/product_row.dart';

class ProductRowWidget extends StatelessWidget {
  final ProductRow product;
  final Map<String, ProductData> productDatabase;
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
            child: DropdownButton<String>(
              value: product.name,
              items: productDatabase.keys.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                if (newValue != null) {
                  onNameChanged(newValue);
                }
              },
              isExpanded: true,
              underline: Container(),
              dropdownColor: isDarkMode
                  ? const Color(0xFF1D1E33)
                  : Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Text(
              '${productData.available}',
              style: TextStyle(
                color: isDarkMode ? Colors.white70 : Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '\$${productData.price.toStringAsFixed(2)}',
              style: TextStyle(
                color: isDarkMode ? Colors.white70 : Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              initialValue: product.quantity.toString(),
              keyboardType: TextInputType.number,
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
              onChanged: (value) {
                final newQuantity = int.tryParse(value) ?? 0;
                final maxAvailable = productData.available;

                if (newQuantity <= maxAvailable) {
                  onQuantityChanged(newQuantity);
                }
              },
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isDarkMode ? Colors.grey[700]! : Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: isDarkMode ? Colors.blue[300]! : Colors.blue,
                  ),
                ),
                fillColor: isDarkMode ? const Color(0xFF2A2D43) : Colors.white,
                filled: true,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              '\$${(productData.price * product.quantity).toStringAsFixed(2)}',
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
