import 'package:flutter/material.dart';
import 'package:onyx_dashboard/core/utils/app_localizations.dart';
import 'package:onyx_dashboard/core/widgets/chart_custom_container.dart';
import 'top_products_chart.dart';

class ProductsChartDetailsCard extends StatelessWidget {
  const ProductsChartDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return ChartCustomContainer(
      title: t.translate('top_products_title'),
      subtitle: t.translate('top_products_subtitle'),
      child: const TopProductsChart(),
    );
  }
}
