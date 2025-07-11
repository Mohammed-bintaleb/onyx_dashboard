import 'package:flutter/material.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomTextTitle extends StatelessWidget {
  const CustomTextTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double titleFontSize = screenWidth < 400
        ? 20
        : (screenWidth < 600 ? 26 : 32);
    double subtitleFontSize = screenWidth < 400
        ? 12
        : (screenWidth < 600 ? 14 : 16);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Customer Orders',
            style: AppStyles.styleBold32(
              context,
            ).copyWith(fontSize: titleFontSize),
          ),
        ),
        const SizedBox(height: 4),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'View and manage all customer .',
            style: AppStyles.styleRegular14(
              context,
            ).copyWith(fontSize: subtitleFontSize),
          ),
        ),
      ],
    );
  }
}
