import 'package:flutter/material.dart';
import 'package:onyx_dashboard/views/widgets/custom_drawer.dart';
import 'custom_app_bar.dart';
import 'customer_orders_view.dart';
import 'dashboard_content.dart';

class DashboardTabletLayout extends StatefulWidget {
  const DashboardTabletLayout({super.key});

  @override
  State<DashboardTabletLayout> createState() => _DashboardTabletLayoutState();
}

class _DashboardTabletLayoutState extends State<DashboardTabletLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = [const DashboardContent(), CustomerOrdersView()];

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          CustomDrawer(
            currentIndex: _currentIndex,
            onItemSelected: _changePage,
          ),
          Expanded(
            child: Column(
              children: [
                const CustomAppBar(),
                Expanded(
                  child: IndexedStack(index: _currentIndex, children: _pages),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
