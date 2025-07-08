import 'package:flutter/material.dart';
import 'package:onyx_dashboard/views/widgets/custom_card.dart';
import 'package:onyx_dashboard/views/widgets/custom_drawer.dart';
import 'custom_app_bar.dart';

class DashboardTabletLayout extends StatelessWidget {
  const DashboardTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          const CustomDrawer(),
          Expanded(
            child: Column(
              children: [
                const CustomAppBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Expanded(
                                child: CustomContainer(
                                  title: 'Total Orders Today',
                                  value: '125',
                                  trendText: '+12% from last period',
                                  titleIcon: Icons.shopping_cart,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: CustomContainer(
                                  title: 'Active Customers',
                                  value: '1,200',
                                  trendText: '+50 from last period',
                                  titleIcon: Icons.people_alt_outlined,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: CustomContainer(
                                  title: 'Revenue This Week',
                                  value: '\$15,231.89',
                                  trendText: '+8.2% from last period',
                                  titleIcon: Icons.attach_money_rounded,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: CustomContainer(
                                  title: 'Top Selling Product',
                                  value: 'Pro Widget',
                                  trendText: 'Model #X-23 from last period',
                                  titleIcon: Icons.inventory,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
