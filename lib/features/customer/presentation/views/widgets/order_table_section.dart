import 'package:flutter/material.dart';
import 'package:onyx_dashboard/core/widgets/chart_custom_container.dart';
import 'package:onyx_dashboard/features/customer/presentation/views/widgets/search_and_filter_bar.dart';
import '../../../domain/Entities/order_entity.dart';
import 'order_table_header.dart';
import 'order_row.dart';

class OrderTableSection extends StatelessWidget {
  final List<OrderEntity> orders;

  const OrderTableSection({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return ChartCustomContainer(
      title: "All Customer Orders",
      subtitle: "A list of all recent orders",
      child: Column(
        children: [
          const SearchAndFilterBar(),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: isDarkMode ? const Color(0xFF1D1E33) : Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              children: [OrderTableHeader(), Divider(height: 1)],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: orders.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) => OrderRow(order: orders[index]),
          ),
        ],
      ),
    );
  }
}
