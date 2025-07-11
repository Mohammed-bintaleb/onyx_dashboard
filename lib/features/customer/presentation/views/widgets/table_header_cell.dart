import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class TableHeaderCell extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final int flex;

  const TableHeaderCell({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: AppStyles.styleBold16(
          context,
        ).copyWith(fontSize: fontSize, color: color),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      ),
    );
  }
}
