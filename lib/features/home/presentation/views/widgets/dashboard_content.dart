import 'package:flutter/material.dart';
import 'package:onyx_dashboard/core/utils/app_localizations.dart';
import '../../../../../core/widgets/chart_custom_container.dart';
import 'custom_container_list_view.dart';
import 'top_products_chart.dart';
import 'weekly_revenue_chart.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

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
                Flexible(
                  fit: FlexFit.loose,
                  child: ChartCustomContainer(
                    title: t.translate('weekly_revenue_title'),
                    subtitle: t.translate('weekly_revenue_subtitle'),
                    child: const WeeklyRevenueChart(),
                  ),
                ),
                const SizedBox(width: 15),
                Flexible(
                  fit: FlexFit.loose,
                  child: ChartCustomContainer(
                    title: t.translate('top_products_title'),
                    subtitle: t.translate('top_products_subtitle'),
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
