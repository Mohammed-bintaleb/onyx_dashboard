import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onyx_dashboard/models/dashboard_ifo_model.dart';

class DashboardInfoListTile extends StatelessWidget {
  const DashboardInfoListTile({super.key, required this.dashboardIfoModel});

  final DashboardIfoModel dashboardIfoModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF0A0E21),
      elevation: 0,
      child: Center(
        child: ListTile(
          leading: SvgPicture.asset(dashboardIfoModel.image),
          title: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              dashboardIfoModel.title,
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          subtitle: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              dashboardIfoModel.subTitle,
              style: TextStyle(color: Colors.white54),
            ),
          ),
        ),
      ),
    );
  }
}
