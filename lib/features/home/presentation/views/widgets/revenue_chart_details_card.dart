import 'package:flutter/material.dart';
import 'package:onyx_dashboard/core/utils/app_localizations.dart';
import 'package:onyx_dashboard/core/widgets/chart_custom_container.dart';
import 'weekly_revenue_chart.dart';

class RevenueChartDetailsCard extends StatelessWidget {
  const RevenueChartDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return ChartCustomContainer(
      title: t.translate('weekly_revenue_title'),
      subtitle: t.translate('weekly_revenue_subtitle'),
      child: const WeeklyRevenueChart(),
    );
  }
}
