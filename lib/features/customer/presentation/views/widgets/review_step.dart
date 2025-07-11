import 'package:flutter/material.dart';

import '../../../domain/Entities/product_row_entity.dart';

class ReviewStep extends StatelessWidget {
  final Map<String, dynamic> formData;
  final List<ProductRowEntity> products;
  final double grandTotal;

  const ReviewStep({
    super.key,
    required this.formData,
    required this.products,
    required this.grandTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Review Order",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildReviewItem("Customer", formData['customer_name'] ?? ''),
        _buildReviewItem("Shipping Address", formData['address'] ?? ''),
        const Divider(height: 32),
        const Text("Products", style: TextStyle(fontWeight: FontWeight.bold)),
        ...products.map(
          (product) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${product.quantity} x ${product.name}"),
                Text(
                  "\$${(product.quantity * _getPrice(product.name)).toStringAsFixed(2)}",
                ),
              ],
            ),
          ),
        ),
        const Divider(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Total", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              "\$${grandTotal.toStringAsFixed(2)}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  double _getPrice(String name) {
    final prices = {
      'Super Thing': 29.99,
      'Gadget Pro': 49.99,
      'Widget A': 9.99,
      'Widget B': 14.99,
      'Ultra Gizmo': 99.99,
    };
    return prices[name] ?? 0.0;
  }

  Widget _buildReviewItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              "$label:",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
