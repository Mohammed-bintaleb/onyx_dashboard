import 'package:flutter/material.dart';
import 'custom_container_list_view.dart';
import 'products_chart_details_card.dart';
import 'revenue_chart_details_card.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomContainerListView(),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(child: const RevenueChartDetailsCard()),
                SizedBox(width: 15),
                Expanded(child: const ProductsChartDetailsCard()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
