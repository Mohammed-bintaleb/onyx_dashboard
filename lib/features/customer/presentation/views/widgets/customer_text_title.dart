import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomTextTitle extends StatelessWidget {
  const CustomTextTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Customer Orders', style: AppStyles.styleBold32(context)),
        SizedBox(height: 4),
        Text(
          'View and manage all customer orders.',
          style: AppStyles.style16(context),
        ),
      ],
    );
  }
}
