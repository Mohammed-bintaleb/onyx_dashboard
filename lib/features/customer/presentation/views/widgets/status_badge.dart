import 'package:flutter/material.dart';
import '../../../../../core/utils/app_localizations.dart';

class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({super.key, required this.status});

  Color _getStatusBackgroundColor(String translatedStatus) {
    switch (translatedStatus) {
      case 'Completed':
      case 'مكتمل':
        return Colors.blue;
      case 'pending':
      case 'قيد الانتظار':
        return Colors.white;
      case 'Shipped':
      case 'تم الشحن':
        return Colors.grey.shade300;
      case 'Canceled':
      case 'ملغي':
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
    final t = AppLocalizations.of(context)!;

    final translatedStatus = t.translate(status.toLowerCase());

    final bgColor = _getStatusBackgroundColor(translatedStatus);
    final textColor = _getStatusTextColor(bgColor);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: bgColor),
      ),
      child: Text(
        translatedStatus,
        style: TextStyle(fontSize: 14, color: textColor),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    );
  }
}
