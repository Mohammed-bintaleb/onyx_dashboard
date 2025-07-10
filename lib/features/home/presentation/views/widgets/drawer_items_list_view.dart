import 'package:flutter/material.dart';
import '../../../data/models/drawer_item_model.dart';
import 'drawer_item.dart';
import '../../../../../core/utils/app_localizations.dart'; // استيراد الترجمة

class DrawerItemsListView extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const DrawerItemsListView({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    final List<DrawerItemModel> items = [
      DrawerItemModel(
        title: t.translate('drawer_dashboard'),
        icon: Icons.dashboard_outlined,
      ),
      DrawerItemModel(
        title: t.translate('drawer_customer_orders'),
        icon: Icons.shopping_cart_outlined,
      ),
      DrawerItemModel(
        title: t.translate('drawer_products'),
        icon: Icons.inventory,
      ),
      DrawerItemModel(
        title: t.translate('drawer_analytics'),
        icon: Icons.analytics,
      ),
      DrawerItemModel(
        title: t.translate('drawer_settings'),
        icon: Icons.settings,
      ),
    ];

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return DrawerItem(
          drawerItemModel: items[index],
          isActive: currentIndex == index,
          onTap: () => onItemSelected(index),
        );
      }, childCount: items.length),
    );
  }
}
