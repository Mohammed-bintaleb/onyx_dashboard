import 'package:flutter/material.dart';

class GrandTotal extends StatelessWidget {
  const GrandTotal({super.key, required this.grandTotal});

  final double grandTotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Grand Total',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '\$${grandTotal.toStringAsFixed(2)}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
