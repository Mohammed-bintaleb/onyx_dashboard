import 'package:flutter/material.dart';
import 'package:onyx_dashboard/utils/app_styles.dart';

import '../../models/custom_container_model.dart';

class CustomContainer extends StatelessWidget {
  final CustomContainerModel model;

  const CustomContainer({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220, // ثابت لتفادي مشاكل العرض
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
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
                Expanded(
                  child: Text(
                    model.title,
                    style: AppStyles.styleMedium16(context),
                  ),
                ),
                Icon(model.titleIcon, color: Colors.grey[600], size: 20),
              ],
            ),
            const SizedBox(height: 12),
            Text(model.value, style: AppStyles.styleBold32(context)),
            const SizedBox(height: 5),
            Text(model.trendText, style: AppStyles.style14(context)),
          ],
        ),
      ),
    );
  }
}
