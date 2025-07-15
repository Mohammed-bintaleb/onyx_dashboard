import 'package:onyx_dashboard/features/customer/domain/Entities/order_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class CustomerRepo {
  Future<Either<Failure, List<OrderEntity>>> getOrders();
  Future<Either<Failure, Unit>> addOrder(OrderEntity order);
  Future<Either<Failure, Unit>> syncPendingOrders();
  Future<Either<Failure, List<OrderEntity>>> getUnsyncedOrders();
  Future<Either<Failure, void>> deleteOrderLocally(String id);
  Future<Either<Failure, void>> updateOrderSyncStatus(String id, bool isSynced);
  Future<Either<Failure, void>> saveOrderLocally(OrderEntity order);
}
