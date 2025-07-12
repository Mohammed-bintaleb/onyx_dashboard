import 'package:flutter/material.dart';

import '../../../../../core/utils/app_localizations.dart';
import 'order_table_header_text.dart';

class OrderTableHeader extends StatelessWidget {
  const OrderTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final t = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1D1E33) : Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
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
          const Flexible(flex: 1, fit: FlexFit.tight, child: SizedBox()),
        ],
      ),
    );
  }
}
