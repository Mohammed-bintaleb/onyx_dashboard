import 'package:onyx_dashboard/features/customer/domain/Entities/order_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class CustomerRepo {
  Future<Either<Failure, List<OrderEntity>>> getOrders();
  Future<Either<Failure, OrderEntity>> getOrderById(String id);
  Future<Either<Failure, Unit>> addOrder(OrderEntity order);
  Future<Either<Failure, Unit>> updateOrder(OrderEntity order);
  Future<Either<Failure, Unit>> deleteOrder(String id);
}
