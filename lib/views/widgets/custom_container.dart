import 'package:flutter/material.dart';
import 'package:onyx_dashboard/utils/app_styles.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String value;
  final String trendText;
  final IconData? titleIcon;

  const CustomContainer({
    super.key,
    required this.title,
    required this.value,
    required this.trendText,
    this.titleIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 8),
                Text(title, style: AppStyles.styleMedium16(context)),
                const Spacer(),
                Icon(titleIcon, color: Colors.grey[600], size: 20),
              ],
            ),
            const SizedBox(height: 12),
            Text(value, style: AppStyles.styleBold32(context)),
            const SizedBox(height: 5),
            Text(trendText, style: AppStyles.style14(context)),
          ],
        ),
      ),
    );
  }
}
