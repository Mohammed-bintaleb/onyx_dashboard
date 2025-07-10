import 'package:flutter/material.dart';
import 'package:onyx_dashboard/features/customer/presentation/views/create_order_view.dart';
import 'package:onyx_dashboard/features/home/presentation/views/widgets/custom_drawer.dart';
import 'custom_app_bar.dart';
import '../../../../customer/presentation/views/customer_orders_view.dart';
import 'dashboard_content.dart';

class DashboardTabletLayout extends StatefulWidget {
  const DashboardTabletLayout({super.key});

  @override
  State<DashboardTabletLayout> createState() => _DashboardTabletLayoutState();
}

class _DashboardTabletLayoutState extends State<DashboardTabletLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      const DashboardContent(),
      CustomerOrdersView(onCreatePassed: () => _changePage(2)),
      const CreateOrderView(),
    ]);
  }

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
