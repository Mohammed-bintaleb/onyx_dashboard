import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onyx_dashboard/core/utils/app_styles.dart';

import '../../../data/models/dashboard_ifo_model.dart';

class DashboardInfoListTile extends StatelessWidget {
  final DashboardInfoModel dashboardInfoModel;

  const DashboardInfoListTile({super.key, required this.dashboardInfoModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        leading: SvgPicture.asset(
          dashboardInfoModel.image,
          width: 40,
          height: 40,
        ),
        title: FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: Text(
            dashboardInfoModel.title,
            style: AppStyles.styleBold32(context).copyWith(color: Colors.white),
          ),
        ),
        subtitle: FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: Text(
            dashboardInfoModel.subTitle,
            style: AppStyles.style14(context).copyWith(color: Colors.grey[600]),
          ),
        ),
      ),
    );
  }
}
