// widgets/drawer_items_list_view.dart
import 'package:flutter/material.dart';
import '../../models/drawer_item_model.dart';
import 'drawer_item.dart';

class DrawerItemsListView extends StatefulWidget {
  const DrawerItemsListView({super.key});

  @override
  State<DrawerItemsListView> createState() => _DrawerItemsListViewState();
}

class _DrawerItemsListViewState extends State<DrawerItemsListView> {
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

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (activeIndex != index) {
              setState(() {
                activeIndex = index;
              });
            }
          },
          child: DrawerItem(
            drawerItemModel: items[index],
            isActive: activeIndex == index,
          ),
        );
      },
    );
  }
}
