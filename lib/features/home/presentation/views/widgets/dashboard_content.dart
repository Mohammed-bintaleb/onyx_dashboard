import 'package:flutter/material.dart';
import 'custom_container_list_view.dart';
import 'products_chart_details_card.dart';
import 'revenue_chart_details_card.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth >= 700;

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const CustomContainerListView(),
              const SizedBox(height: 40),
              isLargeScreen
                  ? const Row(
                      children: [
                        Expanded(child: RevenueChartDetailsCard()),
                        SizedBox(width: 15),
                        Expanded(child: ProductsChartDetailsCard()),
                      ],
                    )
                  : const Column(
                      children: [
                        RevenueChartDetailsCard(),
                        SizedBox(height: 15),
                        ProductsChartDetailsCard(),
                      ],
                    ),
            ]),
          ),
        ),
      ],
    );
  }
}
