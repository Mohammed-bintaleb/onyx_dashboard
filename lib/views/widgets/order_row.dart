import 'package:flutter/material.dart';

import '../../models/order_model.dart';

class OrderRow extends StatelessWidget {
  final Order order;

  const OrderRow({super.key, required this.order});

  Color _statusColor(String status) {
    switch (status) {
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              order.id,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(flex: 3, child: Text(order.customer)),
          Expanded(flex: 2, child: Text(order.date)),
          Expanded(
            flex: 2,
            child: Chip(
              label: Text(
                order.status,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: _statusColor(order.status),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text('\$${order.amount.toStringAsFixed(2)}'),
          ),
          const Icon(Icons.more_vert),
        ],
      ),
    );
  }
}
