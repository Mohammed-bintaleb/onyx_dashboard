import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onyx_dashboard/features/customer/presentation/manger/order_cubit/order_cubit.dart';
import 'package:onyx_dashboard/features/customer/presentation/views/widgets/custom_order_button.dart';
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
  void initState() {
    super.initState();
    context.read<OrderCubit>().fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is OrderLoaded) {
            final totalItems = state.orders.length;

            if (totalItems == 0) {
              // الحالة إذا ما في طلبات
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.inbox,
                        size: 80,
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withOpacity(0.6),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'No orders found',
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: widget.onCreatePassed,
                        child: const Text('Create your first order'),
                      ),
                    ],
                  ),
                ),
              );
            }

            final totalPages = (totalItems / itemsPerPage).ceil();
            final visibleOrders = state.orders.sublist(
              currentPage * itemsPerPage,
              (currentPage * itemsPerPage + itemsPerPage).clamp(0, totalItems),
            );

            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
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
            );
          } else if (state is OrderError) {
            return Center(child: Text('❌ ${state.message}'));
          } else {
            return const SizedBox.shrink();
          }
        },
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
