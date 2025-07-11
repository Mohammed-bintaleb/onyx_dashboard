import 'package:flutter/material.dart';
import 'package:onyx_dashboard/core/utils/app_styles.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({super.key});

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

    final textStyle = AppStyles.styleBold16(context).copyWith(
      fontSize: baseFontSize,
      color: isDarkMode ? Colors.white : Colors.black,
    );

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
          Expanded(
            flex: 2,
            child: Text(
              'Product Name',
              style: textStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 2,
            child: Text(
              'Available',
              style: textStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ),
          Expanded(
            child: Text(
              'Price',
              style: textStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ),
          Expanded(
            child: Text(
              'Quantity',
              style: textStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ),
          Expanded(
            child: Text(
              'Total',
              style: textStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }
}
