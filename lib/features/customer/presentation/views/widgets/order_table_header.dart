import 'package:flutter/material.dart';
import 'package:onyx_dashboard/core/extensions/context_extensions.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_localizations.dart';
import 'order_table_header_text.dart';

class OrderTableHeader extends StatelessWidget {
  const OrderTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final t = AppLocalizations.of(context)!;

    final bgColor = isDark
        ? AppColors.darkBackground
        : AppColors.lightBackground;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border(bottom: BorderSide(color: borderColor, width: 1)),
      ),
      child: Row(
        children: [
          OrderTableHeaderText(text: t.translate("order_id"), flex: 2),
          const SizedBox(width: 14),
          OrderTableHeaderText(text: t.translate("customer_name"), flex: 3),
          const SizedBox(width: 30),
          OrderTableHeaderText(text: t.translate("order_date"), flex: 2),
          const SizedBox(width: 30),
          OrderTableHeaderText(text: t.translate("status"), flex: 2),
          const SizedBox(width: 8),
          OrderTableHeaderText(text: t.translate("total_amount"), flex: 2),
          const SizedBox(width: 8),
          OrderTableHeaderText(text: t.translate("Action"), flex: 1),
        ],
      ),
    );
  }
}
