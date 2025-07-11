import 'package:flutter/material.dart';

import 'order_table_header_text.dart';

class OrderTableHeader extends StatelessWidget {
  const OrderTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1D1E33) : Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: Row(
        children: const [
          OrderTableHeaderText(text: "Order ID", flex: 2),
          SizedBox(width: 14),
          OrderTableHeaderText(text: "Customer Name", flex: 3),
          SizedBox(width: 30),
          OrderTableHeaderText(text: "Order Date", flex: 2),
          SizedBox(width: 30),
          OrderTableHeaderText(text: "Status", flex: 2),
          SizedBox(width: 8),
          OrderTableHeaderText(text: "Total Amount", flex: 2),
          SizedBox(width: 8),
          Flexible(flex: 1, fit: FlexFit.tight, child: SizedBox()),
        ],
      ),
    );
  }
}
