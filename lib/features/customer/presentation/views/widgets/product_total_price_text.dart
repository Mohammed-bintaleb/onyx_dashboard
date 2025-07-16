import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class ProductTotalPriceText extends StatelessWidget {
  final double totalPrice;
  final bool isDarkMode;

  const ProductTotalPriceText({
    super.key,
    required this.totalPrice,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${totalPrice.toStringAsFixed(2)}',
      style: TextStyle(
        color: isDarkMode ? AppColors.darkText : AppColors.lightText,
      ),
    );
  }
}
