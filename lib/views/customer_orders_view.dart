import 'package:flutter/material.dart';
import 'package:onyx_dashboard/utils/app_styles.dart';
import 'package:onyx_dashboard/utils/orders_data.dart.dart';
import 'package:onyx_dashboard/views/widgets/custom_order_button.dart';
import 'widgets/customer_Text_title.dart';
import 'widgets/order_row.dart';
import 'widgets/order_table_header.dart';
import 'widgets/pagination_order_button.dart';
import 'widgets/search_and_filter_bar.dart';

class CustomerOrdersView extends StatefulWidget {
  const CustomerOrdersView({super.key, required this.onCreatePassed});
  final VoidCallback onCreatePassed;

  @override
  State<CustomerOrdersView> createState() => _CustomerOrdersViewState();
}

class _CustomerOrdersViewState extends State<CustomerOrdersView> {
  static const int itemsPerPage = 10;
  int currentPage = 0;
  bool isPreviousPressed = false;
  bool isNextPressed = false;

  @override
  Widget build(BuildContext context) {
    final totalItems = OrdersData.orders.length;
    final totalPages = (totalItems / itemsPerPage).ceil();

    final startIndex = currentPage * itemsPerPage;
    final endIndex = (startIndex + itemsPerPage).clamp(0, totalItems);
    final visibleOrders = OrdersData.orders.sublist(startIndex, endIndex);

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextTitle(),
                CustomOrderButton(onPressed: widget.onCreatePassed),
              ],
            ),
            const SizedBox(height: 24),
            const SearchAndFilterBar(),
            const SizedBox(height: 24),
            const OrderTableHeader(),
            const SizedBox(height: 8),
            Column(
              children: List.generate(
                visibleOrders.length,
                (index) => Column(
                  children: [
                    OrderRow(order: visibleOrders[index]),
                    const Divider(height: 1),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Page ${currentPage + 1} of $totalPages',
                  style: const TextStyle(color: Colors.grey),
                ),
                Row(
                  children: [
                    PaginationButton(
                      isPressed: isPreviousPressed,
                      onPressed: currentPage > 0
                          ? () {
                              setState(() => isPreviousPressed = true);
                              Future.delayed(
                                const Duration(milliseconds: 600),
                                () {
                                  setState(() {
                                    currentPage--;
                                    isPreviousPressed = false;
                                  });
                                },
                              );
                            }
                          : null,
                      icon: Icons.chevron_left,
                      label: 'Previous',
                    ),
                    const SizedBox(width: 8),
                    PaginationButton(
                      isPressed: isNextPressed,
                      onPressed: currentPage < totalPages - 1
                          ? () {
                              setState(() => isNextPressed = true);
                              Future.delayed(
                                const Duration(milliseconds: 600),
                                () {
                                  setState(() {
                                    currentPage++;
                                    isNextPressed = false;
                                  });
                                },
                              );
                            }
                          : null,
                      icon: Icons.chevron_right,
                      label: 'Next',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
