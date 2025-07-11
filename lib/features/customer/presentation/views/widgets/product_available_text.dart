import 'package:flutter/material.dart';

class ProductAvailableText extends StatelessWidget {
  final int available;
  final bool isDarkMode;

  const ProductAvailableText({
    super.key,
    required this.available,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$available',
      style: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black87),
    );
  }
}
