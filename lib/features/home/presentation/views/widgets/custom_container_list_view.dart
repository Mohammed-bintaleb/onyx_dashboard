import 'package:flutter/material.dart';
import '../../../../customer/data/models/custom_container_model.dart';
import 'custom_container.dart';

class CustomContainerListView extends StatelessWidget {
  const CustomContainerListView({super.key});

  static const items = [
    CustomContainerModel(
      title: 'Total Orders Today',
      value: '125',
      trendText: '+12% from last period',
      titleIcon: Icons.shopping_cart_outlined,
    ),
    CustomContainerModel(
      title: 'Active Customers',
      value: '1,200',
      trendText: '+50 from last period',
      titleIcon: Icons.people_alt_outlined,
    ),
    CustomContainerModel(
      title: 'Revenue This Week',
      value: '\$15,231.89',
      trendText: '+8.2% from last period',
      titleIcon: Icons.attach_money_rounded,
    ),
    CustomContainerModel(
      title: 'Top Selling Product',
      value: 'Pro Widget',
      trendText: 'Model #X-23 from last period',
      titleIcon: Icons.inventory,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth >= 800;

    if (isLargeScreen) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: items
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 280,
                      maxWidth: 320,
                    ),
                    child: CustomContainer(model: e),
                  ),
                ),
              )
              .toList(),
        ),
      );
    } else {
      return Column(
        children: items
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CustomContainer(model: e),
              ),
            )
            .toList(),
      );
    }
  }
}
