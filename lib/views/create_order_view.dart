import 'package:flutter/material.dart';
import 'package:onyx_dashboard/views/widgets/customer_details.dart';
import '../utils/app_styles.dart';

class CreateOrderView extends StatelessWidget {
  const CreateOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Create Order', style: AppStyles.styleBold32(context)),
            const SizedBox(height: 4),
            Text(
              'Fill out the form below to create a new customer order.',
              style: AppStyles.style16(context),
            ),
            const SizedBox(height: 24),
            const CustomerDetails(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
