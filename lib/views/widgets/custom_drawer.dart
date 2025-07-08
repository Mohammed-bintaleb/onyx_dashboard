import 'package:flutter/material.dart';
import 'package:onyx_dashboard/views/widgets/dashboard_info_list_tile.dart';
import 'package:onyx_dashboard/views/widgets/drawer_items_list_view.dart';

import '../../models/dashboard_ifo_model.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  final int currentIndex;
  final Function(int) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.2,
      color: const Color(0xFF0A0E21),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: DashboardInfoListTile(
              dashboardInfoModel: DashboardInfoModel(
                image: "assets/images/avatar_3.svg",
                title: 'Onyx Dashboard',
                subTitle: 'Business Platform',
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          DrawerItemsListView(
            currentIndex: currentIndex,
            onItemSelected: onItemSelected,
          ),
        ],
      ),
    );
  }
}
