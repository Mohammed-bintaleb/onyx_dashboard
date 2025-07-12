import 'package:flutter/material.dart';
import 'table_header_cell.dart';
import '../../../../../core/utils/app_localizations.dart';

class AddProductTableHeader extends StatelessWidget {
  const AddProductTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final t = AppLocalizations.of(context)!;

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
            text: t.translate('product_name'),
            fontSize: baseFontSize,
            color: textColor,
            flex: 2,
          ),
          const SizedBox(width: 20),
          TableHeaderCell(
            text: t.translate('available'),
            fontSize: baseFontSize,
            color: textColor,
            flex: 2,
          ),
          TableHeaderCell(
            text: t.translate('price'),
            fontSize: baseFontSize,
            color: textColor,
          ),
          TableHeaderCell(
            text: t.translate('quantity'),
            fontSize: baseFontSize,
            color: textColor,
          ),
          TableHeaderCell(
            text: t.translate('total'),
            fontSize: baseFontSize,
            color: textColor,
          ),
        ],
      ),
    );
  }
}
