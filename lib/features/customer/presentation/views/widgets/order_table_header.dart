import 'package:flutter/material.dart';
import 'package:onyx_dashboard/core/utils/app_styles.dart';

class OrderTableHeader extends StatelessWidget {
  const OrderTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text("Order ID", style: AppStyles.styleBold16(context)),
          ),
          Expanded(
            flex: 3,
            child: Text("Customer Name", style: AppStyles.styleBold16(context)),
          ),
          Expanded(
            flex: 2,
            child: Text("Order Date", style: AppStyles.styleBold16(context)),
          ),
          Expanded(
            flex: 2,
            child: Text("Status", style: AppStyles.styleBold16(context)),
          ),
          Expanded(
            flex: 2,
            child: Text("Total Amount", style: AppStyles.styleBold16(context)),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(), // For actions column
          ),
        ],
      ),
    );
  }
}
