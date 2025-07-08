import 'package:flutter/material.dart';
import 'package:onyx_dashboard/utils/orders_data.dart.dart';
import 'package:onyx_dashboard/views/widgets/custom_order_button.dart';
import 'order_row.dart';
import 'order_table_header.dart';
import 'search_and_filter_bar.dart';

class CustomerOrdersView extends StatelessWidget {
  const CustomerOrdersView({super.key});

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
                    //! لا تنسى تحط الوظيفه
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            const SearchAndFilterBar(),
            const SizedBox(height: 24),
            const OrderTableHeader(),
            Expanded(
              child: ListView.separated(
                itemCount: OrdersData.orders.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  return OrderRow(order: OrdersData.orders[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
