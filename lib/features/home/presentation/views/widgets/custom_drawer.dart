import 'package:flutter/material.dart';
import 'package:onyx_dashboard/features/home/presentation/views/widgets/dashboard_info_list_tile.dart';
import 'package:onyx_dashboard/features/home/presentation/views/widgets/drawer_items_list_view.dart';

import '../../../data/models/dashboard_ifo_model.dart';

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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isRTL = Directionality.of(context) == TextDirection.rtl;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final double drawerWidth = (screenWidth * 0.2).clamp(250, 300);
    return Align(
      alignment: isRTL ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        width: drawerWidth,
        decoration: BoxDecoration(
          color: const Color(0xFF0A0E21),
          border: Border(
            right: isRTL
                ? BorderSide.none
                : (isDark
                      ? BorderSide(color: Colors.white24, width: 1)
                      : BorderSide(color: Colors.grey.shade300, width: 1)),
            left: isRTL
                ? (isDark
                      ? BorderSide(color: Colors.white24, width: 1)
                      : BorderSide(color: Colors.grey.shade300, width: 1))
                : BorderSide.none,
          ),
        ),
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
      ),
    );
  }
}
