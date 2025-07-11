import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: Text(
            'Onyx',
            style: AppStyles.styleBold32(context).copyWith(color: Colors.blue),
          ),
        ),
        FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: Text(
            'Dashboard',
            style: AppStyles.styleBold32(context).copyWith(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
