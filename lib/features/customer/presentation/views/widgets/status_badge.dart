import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({super.key, required this.status});

  Color _getStatusBackgroundColor() {
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

  Color _getStatusTextColor(Color bgColor) {
    return bgColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = _getStatusBackgroundColor();
    final textColor = _getStatusTextColor(bgColor);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: bgColor),
      ),
      child: Text(
        status,
        style: TextStyle(fontSize: 14, color: textColor),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    );
  }
}
