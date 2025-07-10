import 'package:flutter/material.dart';

import '../../models/product_data.dart';
import '../../models/product_row.dart';

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
    final productData = productDatabase[product.name]!;

    return Container(
      // margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: DropdownButton<String>(
              value: product.name,
              items: productDatabase.keys.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                if (newValue != null) {
                  onNameChanged(newValue);
                }
              },
              isExpanded: true,
              underline: Container(),
            ),
          ),
          SizedBox(width: 10),
          Expanded(child: Text('${productData.available}')),
          Expanded(child: Text('\$${productData.price.toStringAsFixed(2)}')),
          Expanded(
            child: TextFormField(
              initialValue: product.quantity.toString(),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                final newQuantity = int.tryParse(value) ?? 0;
                final maxAvailable = productData.available;

                if (newQuantity <= maxAvailable) {
                  onQuantityChanged(newQuantity);
                }
              },
              decoration: const InputDecoration(
                isDense: true,
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              '\$${(productData.price * product.quantity).toStringAsFixed(2)}',
            ),
          ),
        ],
      ),
    );
  }
}
