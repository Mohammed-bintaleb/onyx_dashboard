import 'package:flutter/material.dart';
import 'package:onyx_dashboard/core/extensions/context_extensions.dart';
import '../../../../../core/theme/app_colors.dart';
import 'table_header_cell.dart';
import '../../../../../core/utils/app_localizations.dart';

class AddProductTableHeader extends StatelessWidget {
  const AddProductTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final t = AppLocalizations.of(context)!;

    final screenWidth = MediaQuery.of(context).size.width;
    double baseFontSize = 16;
    if (screenWidth < 400) {
      baseFontSize = 12;
    } else if (screenWidth < 600) {
      baseFontSize = 14;
    }

    final textColor = isDark ? AppColors.darkText : AppColors.lightText;
    final backgroundColor = isDark ? AppColors.darkCard : AppColors.lightCard;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          top: BorderSide(color: borderColor),
          left: BorderSide(color: borderColor),
          right: BorderSide(color: borderColor),
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
