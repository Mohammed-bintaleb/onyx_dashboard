import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onyx_dashboard/features/customer/domain/Entities/order_entity.dart';

import '../../../domain/use_case/add_order_use_case.dart';
import '../../../domain/use_case/delete_order_use_case.dart';
import '../../../domain/use_case/get_orders_use_case.dart';
import '../../../domain/use_case/update_order_use_case.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final GetOrdersUseCase getOrdersUseCase;
  final AddOrderUseCase addOrderUseCase;
  final UpdateOrderUseCase updateOrderUseCase;
  final DeleteOrderUseCase deleteOrderUseCase;

  OrderCubit({
    required this.getOrdersUseCase,
    required this.addOrderUseCase,
    required this.updateOrderUseCase,
    required this.deleteOrderUseCase,
  }) : super(OrderInitial());

  Future<void> fetchOrders() async {
    emit(OrderLoading());
    final result = await getOrdersUseCase.call();
    result.fold(
      (failure) => emit(OrderError(failure.message)),
      (orders) => emit(OrderLoaded(orders)),
    );
  }

  Future<void> addOrder(OrderEntity order) async {
    await addOrderUseCase.call(order);
    fetchOrders();
  }

  Future<void> updateOrder(OrderEntity order) async {
    await updateOrderUseCase.call(order);
    fetchOrders();
  }

  Future<void> deleteOrder(String id) async {
    await deleteOrderUseCase.call(id);
    fetchOrders();
  }
}
