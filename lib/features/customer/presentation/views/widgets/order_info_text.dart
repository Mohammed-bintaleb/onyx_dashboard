import 'package:flutter/material.dart';

class OrderInfoText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final int flex;
  final FlexFit fit;

  const OrderInfoText({
    super.key,
    required this.text,
    required this.style,
    this.flex = 1,
    this.fit = FlexFit.tight,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      fit: fit,
      child: Text(
        text,
        style: style,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
