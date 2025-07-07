import 'package:flutter/material.dart';
import 'package:onyx_dashboard/views/widgets/custom_drawer.dart';

class DashboardTabletLayout extends StatelessWidget {
  const DashboardTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [const CustomDrawer()]);
  }
}
