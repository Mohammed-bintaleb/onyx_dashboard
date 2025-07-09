import 'package:flutter/material.dart';
import '../utils/app_styles.dart';

class CreateOrderView extends StatelessWidget {
  const CreateOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Create Order', style: AppStyles.styleBold32(context)),
                  SizedBox(height: 4),
                  Text(
                    'Fill out the form below to create a new customer order.',
                    style: AppStyles.style16(context),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
