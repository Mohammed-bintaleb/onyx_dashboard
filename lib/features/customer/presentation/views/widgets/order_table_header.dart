import 'package:flutter/material.dart';
import 'package:onyx_dashboard/core/utils/app_styles.dart';

class OrderTableHeader extends StatelessWidget {
  const OrderTableHeader({super.key});

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

    final textStyle = AppStyles.styleBold16(
      context,
    ).copyWith(fontSize: baseFontSize);

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
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Text(
              "Order ID",
              style: textStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 14),
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Text(
              "Customer Name",
              style: textStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 30),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Text(
              "Order Date",
              style: textStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 30),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Text(
              "Status",
              style: textStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Text(
              "Total Amount",
              style: textStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 8),
          const Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: SizedBox(), // For actions column (الأيقونة)
          ),
        ],
      ),
    );
  }
}
