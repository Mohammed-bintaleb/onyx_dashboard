import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class OrderTableHeaderText extends StatelessWidget {
  final String text;
  final int flex;

  const OrderTableHeaderText({
    super.key,
    required this.text,
    required this.flex,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double baseFontSize = 16;
    if (screenWidth < 400) {
      baseFontSize = 12;
    } else if (screenWidth < 600) {
      baseFontSize = 14;
    }

    final textStyle = AppStyles.styleBold16(
      context,
    ).copyWith(fontSize: baseFontSize);

    return Flexible(
      flex: flex,
      fit: FlexFit.tight,
      child: Text(
        text,
        style: textStyle,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
