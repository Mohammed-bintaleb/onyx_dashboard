import 'package:flutter/material.dart';
import 'package:onyx_dashboard/core/extensions/context_extensions.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../domain/Entities/order_entity.dart';
import 'order_info_text.dart';
import 'status_badge.dart';

class OrderRow extends StatefulWidget {
  final OrderEntity order;

  const OrderRow({super.key, required this.order});

  @override
  State<OrderRow> createState() => _OrderRowState();
}

class _OrderRowState extends State<OrderRow> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    final screenWidth = MediaQuery.of(context).size.width;
    double baseFontSize = 16;
    if (screenWidth < 400) {
      baseFontSize = 12;
    } else if (screenWidth < 600) {
      baseFontSize = 14;
    }

    final textStyle = AppStyles.styleMedium16(
      context,
    ).copyWith(fontSize: baseFontSize);

    final bgColor = _isHovered
        ? (isDark ? AppColors.darkHover : AppColors.lightHover)
        : (isDark ? AppColors.darkBackground : AppColors.lightBackground);

    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border(bottom: BorderSide(color: borderColor, width: 1)),
        ),
        child: Row(
          children: [
            OrderInfoText(text: widget.order.id, style: textStyle, flex: 2),
            OrderInfoText(
              text: widget.order.customer,
              style: textStyle,
              flex: 3,
            ),
            OrderInfoText(text: widget.order.date, style: textStyle, flex: 2),
            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: Align(
                alignment: Alignment.centerLeft,
                child: StatusBadge(status: widget.order.status),
              ),
            ),
            const SizedBox(width: 30),
            OrderInfoText(
              text: '\$${widget.order.amount.toStringAsFixed(2)}',
              style: textStyle,
              flex: 2,
            ),
            const SizedBox(width: 15),
            const SizedBox(
              width: 30,
              child: Icon(Icons.more_vert, color: AppColors.iconGrey),
            ),
          ],
        ),
      ),
    );
  }
}
