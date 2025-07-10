import 'package:flutter/material.dart';
import 'package:onyx_dashboard/features/customer/presentation/views/widgets/custom_order_button.dart';
import '../../../../core/utils/orders_data.dart.dart';
import 'widgets/customer_text_title.dart';
import 'widgets/order_row.dart';
import 'widgets/order_table_header.dart';
import '../../../home/presentation/views/widgets/pagination_order_button.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTextTitle(),
                  CustomOrderButton(onPressed: widget.onCreatePassed),
                ],
              ),
              const SizedBox(height: 24),

              // Search and Filter
              const SearchAndFilterBar(),
              const SizedBox(height: 24),

              // Orders Table
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Table Header
                    const OrderTableHeader(),

                    // Table Rows
                    ...visibleOrders.map((order) => OrderRow(order: order)),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Pagination
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Page ${currentPage + 1} of $totalPages',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
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
      ),
    );
  }
}
