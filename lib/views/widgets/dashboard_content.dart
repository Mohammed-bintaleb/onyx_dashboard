import 'package:flutter/material.dart';

import 'chart_custom_container.dart';
import 'custom_container_list_view.dart';
import 'top_products_chart.dart';
import 'weekly_revenue_chart.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CustomContainerListView(),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: ChartCustomContainer(
                    title: 'Weekly Revenue',
                    subtitle: 'A line chart showing revenue over the past week',
                    child: const WeeklyRevenueChart(),
                  ),
                ),
                Expanded(
                  child: ChartCustomContainer(
                    title: 'Top Products by Orders',
                    subtitle: 'A bar chart showing the most ordered Products',
                    child: TopProductsChart(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
