import 'package:flutter/material.dart';
import 'package:onyx_dashboard/core/utils/app_localizations.dart';
import '../../../../customer/data/models/custom_container_model.dart';
import 'custom_container.dart';

class CustomContainerListView extends StatelessWidget {
  const CustomContainerListView({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth >= 800;

    final items = [
      CustomContainerModel(
        title: t.translate('total_orders_today'),
        value: '125',
        trendText: t.translate('trend_orders_today'),
        titleIcon: Icons.shopping_cart_outlined,
      ),
      CustomContainerModel(
        title: t.translate('active_customers'),
        value: '1,200',
        trendText: t.translate('trend_active_customers'),
        titleIcon: Icons.people_alt_outlined,
      ),
      CustomContainerModel(
        title: t.translate('revenue_this_week'),
        value: '\$15,231.89',
        trendText: t.translate('trend_revenue'),
        titleIcon: Icons.attach_money_rounded,
      ),
      CustomContainerModel(
        title: t.translate('top_selling_product'),
        value: 'Pro Widget',
        trendText: t.translate('trend_top_product'),
        titleIcon: Icons.inventory,
      ),
    ];

    if (isLargeScreen) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: items
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 280,
                      maxWidth: 320,
                    ),
                    child: CustomContainer(model: e),
                  ),
                ),
              )
              .toList(),
        ),
      );
    } else {
      return Column(
        children: items
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CustomContainer(model: e),
              ),
            )
            .toList(),
      );
    }
  }
}
