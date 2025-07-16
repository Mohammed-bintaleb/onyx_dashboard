import 'package:flutter/material.dart';
import '../../../../../core/utils/app_localizations.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomTextTitle extends StatelessWidget {
  const CustomTextTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final t = AppLocalizations.of(context)!;

    double titleFontSize = screenWidth < 500
        ? 20
        : (screenWidth < 500 ? 20 : 25);
    double subtitleFontSize = screenWidth < 500
        ? 12
        : (screenWidth < 500 ? 14 : 14);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            t.translate('customer_orders_title'),
            style: AppStyles.styleBold32(
              context,
            ).copyWith(fontSize: titleFontSize),
          ),
        ),
        const SizedBox(height: 4),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            t.translate('customer_orders_subtitle'),
            style: AppStyles.style16(
              context,
            ).copyWith(fontSize: subtitleFontSize),
          ),
        ),
      ],
    );
  }
}
