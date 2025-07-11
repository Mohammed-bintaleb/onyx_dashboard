import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class TitleSection extends StatelessWidget {
  final Color textColor;

  const TitleSection({required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Create Order",
          style: AppStyles.styleBold32(context).copyWith(color: textColor),
        ),
        const SizedBox(height: 10),
        Text(
          "Fill out the form below to create a new customer order",
          style: AppStyles.style16(context).copyWith(color: textColor),
        ),
      ],
    );
  }
}
