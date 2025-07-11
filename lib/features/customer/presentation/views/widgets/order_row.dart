// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:onyx_dashboard/core/utils/app_styles.dart';
import '../../../data/models/order_model.dart';

class OrderRow extends StatefulWidget {
  final Order order;

  const OrderRow({super.key, required this.order});

  @override
  State<OrderRow> createState() => _OrderRowState();
}

class _OrderRowState extends State<OrderRow> {
  bool _isHovered = false;

  Color _getStatusBackgroundColor(String status) {
    switch (status) {
      case 'Completed':
        return Colors.blue;
      case 'Pending':
        return Colors.white;
      case 'Shipped':
        return Colors.grey.shade300;
      case 'Canceled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Color _getStatusTextColor(String status) {
    final bgColor = _getStatusBackgroundColor(status);

    return bgColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // نحسب حجم الخط بناءً على عرض الشاشة
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
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Text(
                widget.order.id,
                style: textStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),

            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Text(
                widget.order.customer,
                style: textStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),

            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Text(
                widget.order.date,
                style: textStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),

            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: Align(
                alignment: Alignment.centerLeft,
                child: IntrinsicWidth(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusBackgroundColor(widget.order.status),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: _getStatusBackgroundColor(widget.order.status),
                      ),
                    ),
                    child: Text(
                      widget.order.status,
                      style: textStyle.copyWith(
                        fontSize: textStyle.fontSize! - 2,
                        color: _getStatusTextColor(widget.order.status),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(width: 30),

            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Text(
                '\$${widget.order.amount.toStringAsFixed(2)}',
                style: textStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),

            SizedBox(
              width: 30,
              child: Icon(Icons.more_vert, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
