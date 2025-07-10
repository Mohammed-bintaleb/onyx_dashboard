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
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: _isHovered
              ? Colors.grey.withOpacity(0.1)
              : Theme.of(context).cardColor,
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                widget.order.id,
                style: AppStyles.styleMedium16(context),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                widget.order.customer,
                style: AppStyles.styleMedium16(context),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                widget.order.date,
                style: AppStyles.styleMedium16(context),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: _getStatusBackgroundColor(widget.order.status),
                  borderRadius: BorderRadius.circular(99),
                  border: Border.all(
                    color: _getStatusBackgroundColor(widget.order.status),
                  ),
                ),
                child: Text(
                  widget.order.status,
                  style: AppStyles.styleMedium16(
                    context,
                  ).copyWith(color: _getStatusTextColor(widget.order.status)),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(width: 90),
            Expanded(
              flex: 2,
              child: Text(
                '\$${widget.order.amount.toStringAsFixed(2)}',
                style: AppStyles.styleMedium16(context),
              ),
            ),
            SizedBox(width: 30),
            const Expanded(child: Icon(Icons.more_vert, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
