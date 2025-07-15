part of 'order_cubit.dart';

abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderSaving extends OrderState {}

class OrderSaved extends OrderState {}

class OrderLoaded extends OrderState {
  final List<OrderEntity> orders;
  OrderLoaded(this.orders);
}

class OrderError extends OrderState {
  final String message;
  OrderError(this.message);
}
