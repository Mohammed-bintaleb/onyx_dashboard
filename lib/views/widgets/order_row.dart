import 'package:flutter/material.dart';
import 'package:onyx_dashboard/utils/app_styles.dart';

import '../../models/order_model.dart';

class OrderRow extends StatefulWidget {
  final Order order;

  const OrderRow({super.key, required this.order});

  @override
  State<OrderRow> createState() => _OrderRowState();
}

class _OrderRowState extends State<OrderRow> {
  bool isHovered = false;

  Color _statusColor(String status) {
    switch (status) {
      case 'Peding':
        return Colors.white;
      case 'Completed':
        return Colors.blue;
      case 'Shipped':
        return Colors.grey;
      case 'Canceled':
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.order.id,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            Expanded(child: Text(widget.order.customer)),
            Spacer(),
            Expanded(child: Text(widget.order.date)),
            Spacer(),
            Expanded(
              child: Chip(
                label: Text(
                  widget.order.status,
                  style: AppStyles.style16(
                    context,
                  ).copyWith(color: Colors.black),
                ),
                backgroundColor: _statusColor(widget.order.status),
              ),
            ),
            Spacer(),
            Expanded(
              child: Text('\$${widget.order.amount.toStringAsFixed(2)}'),
            ),
            Spacer(),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.more_vert),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
