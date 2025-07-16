import 'package:flutter/material.dart';
import 'package:onyx_dashboard/core/extensions/context_extensions.dart';
import 'package:onyx_dashboard/core/utils/app_styles.dart';
import 'package:onyx_dashboard/core/theme/app_colors.dart';
import '../../../../customer/data/models/custom_container_model.dart';

class CustomContainer extends StatelessWidget {
  final CustomContainerModel model;

  const CustomContainer({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : AppColors.lightCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
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
                Icon(model.titleIcon, color: AppColors.iconGrey, size: 20),
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
