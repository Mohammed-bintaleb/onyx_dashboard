import 'package:flutter/material.dart';
import 'package:onyx_dashboard/views/widgets/custom_container.dart';
import 'package:onyx_dashboard/views/widgets/custom_container_list_view.dart';
import 'package:onyx_dashboard/views/widgets/custom_drawer.dart';
import 'package:onyx_dashboard/views/widgets/weekly_revenue_chart.dart';
import 'chart_custom_container.dart';
import 'custom_app_bar.dart';

class DashboardTabletLayout extends StatelessWidget {
  const DashboardTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          const CustomDrawer(),
          Expanded(
            child: Column(
              children: [
                const CustomAppBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          CustomContainerListView(),
                          SizedBox(height: 40),
                          Row(
                            children: [
                              Expanded(
                                child: ChartCustomContainer(
                                  title: 'Weekly Revenue',
                                  subtitle: 'Last 7 days performance',
                                  child: const WeeklyRevenueChart(),
                                ),
                              ),
                              Expanded(
                                child: ChartCustomContainer(
                                  title: 'Weekly Revenue',
                                  subtitle: 'Last 7 days performance',
                                  child: const WeeklyRevenueChart(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
