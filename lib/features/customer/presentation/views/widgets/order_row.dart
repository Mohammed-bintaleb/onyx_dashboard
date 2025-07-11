import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../domain/Entities/order_entity.dart';
import 'order_info_text.dart';
import 'status_badge.dart';

class OrderRow extends StatefulWidget {
  final OrderEntity order;

  const OrderRow({super.key, required this.order});

  @override
  State<OrderRow> createState() => _OrderRowState();
}

class _OrderRowState extends State<OrderRow> {
  bool _isHovered = false;

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

    final textStyle = AppStyles.styleMedium16(
      context,
    ).copyWith(fontSize: baseFontSize);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: _isHovered
              ? Colors.grey.withOpacity(0.1)
              : isDarkMode
              ? const Color(0xFF1D1E33)
              : Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
        ),
        child: Row(
          children: [
            OrderInfoText(text: widget.order.id, style: textStyle, flex: 2),
            OrderInfoText(
              text: widget.order.customer,
              style: textStyle,
              flex: 3,
            ),
            OrderInfoText(text: widget.order.date, style: textStyle, flex: 2),
            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: Align(
                alignment: Alignment.centerLeft,
                child: StatusBadge(status: widget.order.status),
              ),
            ),
            const SizedBox(width: 30),
            OrderInfoText(
              text: '\$${widget.order.amount.toStringAsFixed(2)}',
              style: textStyle,
              flex: 2,
            ),
            const SizedBox(width: 30),
            const SizedBox(
              width: 30,
              child: Icon(Icons.more_vert, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
