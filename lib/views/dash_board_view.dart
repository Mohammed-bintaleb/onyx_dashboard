import 'package:flutter/material.dart';
import 'package:onyx_dashboard/views/widgets/adaptive_layout_widget.dart';
import 'package:onyx_dashboard/views/widgets/dashboard_tablet_layout.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileLayout: (context) => SizedBox(),
        tabletLayout: (context) => DashboardTabletLayout(),
      ),
    );
  }
}
