import 'package:flutter/material.dart';

import '../../features/home/presentation/views/widgets/dashboard_mobile_layout.dart';
import '../../features/home/presentation/views/widgets/dashboard_tablet_layout.dart';

class ResponsiveDashboardWrapper extends StatelessWidget {
  final Widget child;
  const ResponsiveDashboardWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= 800) {
      return DashboardTabletLayout(child: child);
    } else {
      return DashboardMobileLayout(child: child);
    }
  }
}
