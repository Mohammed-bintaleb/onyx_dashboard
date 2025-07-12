import 'package:flutter/material.dart';
import '../../../../../core/utils/app_localizations.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomTextTitle extends StatelessWidget {
  const CustomTextTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final t = AppLocalizations.of(context)!;

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
            style: AppStyles.styleRegular14(
              context,
            ).copyWith(fontSize: subtitleFontSize),
          ),
        ),
      ],
    );
  }
}
