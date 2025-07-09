import 'package:flutter/material.dart';
import 'package:onyx_dashboard/utils/app_styles.dart';

class OrderTableHeader extends StatelessWidget {
  const OrderTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      color: Colors.grey[200],
      child: Row(
        children: [
          Expanded(
            child: Text("Order ID", style: AppStyles.styleBold16(context)),
          ),
          Spacer(),
          Expanded(
            child: Text("Customer Name", style: AppStyles.styleBold16(context)),
          ),
          Spacer(),
          Expanded(
            child: Text("Order Date", style: AppStyles.styleBold16(context)),
          ),
          Spacer(),
          Expanded(
            child: Text("Status", style: AppStyles.styleBold16(context)),
          ),
          Spacer(),
          Expanded(
            child: Text("Total Amount", style: AppStyles.styleBold16(context)),
          ),
          Spacer(),
          Expanded(
            child: Text("Actions", style: AppStyles.styleBold16(context)),
          ),
        ],
      ),
    );
  }
}
