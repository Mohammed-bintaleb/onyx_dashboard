import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onyx_dashboard/utils/app_styles.dart';

import '../../models/dashboard_ifo_model.dart';

class DashboardInfoListTile extends StatelessWidget {
  final DashboardInfoModel dashboardInfoModel;

  const DashboardInfoListTile({super.key, required this.dashboardInfoModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(dashboardInfoModel.image, width: 40, height: 40),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dashboardInfoModel.title,
                style: AppStyles.styleBold32(
                  context,
                ).copyWith(color: Colors.white),
              ),
              Text(
                dashboardInfoModel.subTitle,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
