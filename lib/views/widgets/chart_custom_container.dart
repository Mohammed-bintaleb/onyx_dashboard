import 'package:flutter/material.dart';
import 'package:onyx_dashboard/utils/app_styles.dart';

class ChartCustomContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const ChartCustomContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).scaffoldBackgroundColor
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppStyles.styleBold32(context)),
          const SizedBox(height: 4),
          Text(subtitle, style: AppStyles.styleRegular14(context)),

          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}
