import 'package:flutter/material.dart';
import 'package:onyx_dashboard/core/extensions/context_extensions.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/app_localizations.dart';
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
  String searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  void onFilterChanged(String? value) {
    if (value != null) {
      setState(() {
        selectedFilter = value;
      });
    }
  }

  List<OrderEntity> get filteredOrders {
    return widget.orders.where((order) {
      final matchesStatus =
          selectedFilter == "All Statuses" ||
          order.status.toLowerCase() == selectedFilter.toLowerCase();

      final matchesSearch =
          order.id.toLowerCase().contains(searchQuery) ||
          order.customer.toLowerCase().contains(searchQuery);

      return matchesStatus && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final isDark = context.isDarkMode;

    final backgroundColor = isDark
        ? AppColors.darkBackground
        : AppColors.lightBackground;

    return ChartCustomContainer(
      title: t.translate("all_customer_orders"),
      subtitle: t.translate("recent_orders_subtitle"),
      child: Column(
        children: [
          SearchAndFilterBar(
            searchController: _searchController,
            onSearchChanged: (value) {
              setState(() {
                searchQuery = value.toLowerCase();
              });
            },
            selectedFilter: selectedFilter,
            onFilterChanged: onFilterChanged,
          ),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final isSmallScreen = constraints.maxWidth < 700;

              Widget table = Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      children: [OrderTableHeader(), Divider(height: 1)],
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredOrders.length,
                    separatorBuilder: (context, index) =>
                        const Divider(height: 1),
                    itemBuilder: (context, index) =>
                        OrderRow(order: filteredOrders[index]),
                  ),
                ],
              );

              if (isSmallScreen) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 700,
                      maxWidth: 900,
                    ),
                    child: table,
                  ),
                );
              } else {
                return table;
              }
            },
          ),
        ],
      ),
    );
  }
}
