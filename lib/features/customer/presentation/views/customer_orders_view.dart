import 'package:flutter/material.dart';
import 'package:onyx_dashboard/features/customer/presentation/views/widgets/custom_order_button.dart';
import '../../data/data_source/orders_data.dart.dart';
import 'widgets/customer_text_title.dart';
import 'widgets/order_table_section.dart';
import 'widgets/pagination_controls.dart';

class CustomerOrdersView extends StatefulWidget {
  const CustomerOrdersView({super.key, required this.onCreatePassed});
  final VoidCallback onCreatePassed;

  @override
  State<CustomerOrdersView> createState() => _CustomerOrdersViewState();
}

class _CustomerOrdersViewState extends State<CustomerOrdersView> {
  static const int itemsPerPage = 10;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final totalItems = OrdersData.orders.length;
    final totalPages = (totalItems / itemsPerPage).ceil();
    final visibleOrders = OrdersData.orders.sublist(
      currentPage * itemsPerPage,
      (currentPage * itemsPerPage + itemsPerPage).clamp(0, totalItems),
    );

    return Scaffold(
      body: SingleChildScrollView(
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
            OrderTableSection(orders: visibleOrders),
            const SizedBox(height: 24),
            PaginationControls(
              currentPage: currentPage,
              totalPages: totalPages,
              onPrevious: currentPage > 0 ? _goToPreviousPage : null,
              onNext: currentPage < totalPages - 1 ? _goToNextPage : null,
            ),
          ],
        ),
      ),
    );
  }

  void _goToPreviousPage() {
    setState(() => currentPage--);
  }

  void _goToNextPage() {
    setState(() => currentPage++);
  }
}
