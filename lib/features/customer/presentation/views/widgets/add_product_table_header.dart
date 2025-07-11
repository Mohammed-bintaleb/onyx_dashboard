import 'package:flutter/material.dart';

import 'table_header_cell.dart';

class AddProductTableHeader extends StatelessWidget {
  const AddProductTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final screenWidth = MediaQuery.of(context).size.width;
    double baseFontSize = 16;
    if (screenWidth < 400) {
      baseFontSize = 12;
    } else if (screenWidth < 600) {
      baseFontSize = 14;
    }

    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1D1E33) : Colors.grey[100],
        border: Border(
          top: BorderSide(color: isDarkMode ? Colors.grey[700]! : Colors.grey),
          left: BorderSide(color: isDarkMode ? Colors.grey[700]! : Colors.grey),
          right: BorderSide(
            color: isDarkMode ? Colors.grey[700]! : Colors.grey,
          ),
        ),
      ),
      child: Row(
        children: [
          TableHeaderCell(
            text: 'Product Name',
            fontSize: baseFontSize,
            color: textColor,
            flex: 2,
          ),
          const SizedBox(width: 20),
          TableHeaderCell(
            text: 'Available',
            fontSize: baseFontSize,
            color: textColor,
            flex: 2,
          ),
          TableHeaderCell(
            text: 'Price',
            fontSize: baseFontSize,
            color: textColor,
          ),
          TableHeaderCell(
            text: 'Quantity',
            fontSize: baseFontSize,
            color: textColor,
          ),
          TableHeaderCell(
            text: 'Total',
            fontSize: baseFontSize,
            color: textColor,
          ),
        ],
      ),
    );
  }
}
