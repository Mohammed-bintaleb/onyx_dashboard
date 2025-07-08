import 'package:flutter/material.dart';
import 'package:onyx_dashboard/views/widgets/chart_custom_container.dart';
import 'package:onyx_dashboard/views/widgets/custom_order_button.dart';

import '../../models/order_model.dart';
import 'search_and_filter_bar.dart';

class CustomerOrdersView extends StatelessWidget {
  CustomerOrdersView({super.key});

  final List<Order> orders = [
    Order("ORD011", "Hannah White", "7/19/2024", "Completed", 180.00),
    Order("ORD012", "Ian Green", "7/19/2024", "Completed", 95.20),
    Order("ORD013", "Jack Black", "7/18/2024", "Shipped", 500.00),
    Order("ORD014", "Karen Hill", "7/18/2024", "Canceled", 32.50),
    Order("ORD015", "Leo King", "7/17/2024", "Completed", 175.00),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Customer Orders',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'View and manage all customer orders.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
                CustomOrderButton(
                  onPressed: () {
                    // Add your button action here
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            const SearchAndFilterBar(),
            const SizedBox(height: 24),
            // const _OrderTableHeader(),
            // Expanded(
            //   child: ListView.separated(
            //     itemCount: orders.length,
            //     separatorBuilder: (_, __) => const Divider(height: 1),
            //     itemBuilder: (context, index) {
            //       return _OrderRow(order: orders[index]);
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
