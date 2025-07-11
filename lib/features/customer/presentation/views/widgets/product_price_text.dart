import 'package:flutter/material.dart';

class ProductPriceText extends StatelessWidget {
  final double price;
  final bool isDarkMode;

  const ProductPriceText({
    super.key,
    required this.price,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${price.toStringAsFixed(2)}',
      style: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black87),
    );
  }
}
