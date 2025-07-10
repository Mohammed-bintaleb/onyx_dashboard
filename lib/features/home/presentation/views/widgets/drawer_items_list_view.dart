import 'package:flutter/material.dart';
import '../../../data/models/drawer_item_model.dart';
import 'drawer_item.dart';

class DrawerItemsListView extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemSelected;

  const DrawerItemsListView({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  final List<DrawerItemModel> items = const [
    DrawerItemModel(title: 'Dashboard', icon: Icons.dashboard_outlined),
    DrawerItemModel(
      title: 'Customer Orders',
      icon: Icons.shopping_cart_outlined,
    ),
    DrawerItemModel(title: 'Products', icon: Icons.inventory),
    DrawerItemModel(title: 'Analytics', icon: Icons.analytics),
    DrawerItemModel(title: 'Settings', icon: Icons.settings),
  ];

  @override
  Widget build(BuildContext context) {
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
