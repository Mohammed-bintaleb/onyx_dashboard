import 'package:flutter/material.dart';

import '../../../../../core/widgets/chart_custom_container.dart';
import '../../../domain/Entities/order_entity.dart';
import 'order_row.dart';
import 'order_table_header.dart';
import 'search_and_filter_bar.dart';

class OrderTableSection extends StatefulWidget {
  final List<OrderEntity> orders;

  const OrderTableSection({super.key, required this.orders});

  @override
  State<OrderTableSection> createState() => _OrderTableSectionState();
}

class _OrderTableSectionState extends State<OrderTableSection> {
  String selectedFilter = "All Statuses";

  void onFilterChanged(String? value) {
    if (value != null) {
      setState(() {
        selectedFilter = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return ChartCustomContainer(
      title: "All Customer Orders",
      subtitle: "A list of all recent orders",
      child: Column(
        children: [
          SearchAndFilterBar(
            selectedFilter: selectedFilter,
            onFilterChanged: onFilterChanged,
          ),
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
            itemCount: widget.orders.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) =>
                OrderRow(order: widget.orders[index]),
          ),
        ],
      ),
    );
  }
}
