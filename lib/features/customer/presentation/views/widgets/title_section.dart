import 'package:flutter/material.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/app_localizations.dart';

class TitleSection extends StatelessWidget {
  final Color textColor;

  const TitleSection({super.key, required this.textColor});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.translate('create_order'),
          style: AppStyles.styleBold32(context).copyWith(color: textColor),
        ),
        const SizedBox(height: 10),
        Text(
          t.translate('create_order_subtitle'),
          style: AppStyles.style16(context).copyWith(color: textColor),
        ),
      ],
    );
  }
}
