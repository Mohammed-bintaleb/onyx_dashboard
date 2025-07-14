import 'package:dartz/dartz.dart';
import 'package:onyx_dashboard/core/errors/failure.dart';
import 'package:onyx_dashboard/features/customer/domain/Entities/order_entity.dart';
import 'package:onyx_dashboard/features/customer/domain/repo/customer_repo.dart';

import '../data_source/customer_local_data_source.dart';
import '../data_source/customer_remote_data_source.dart';

class CustomerRepoImpl implements CustomerRepo {
  final CustomerRemoteDataSource remote;
  final CustomerLocalDataSource local;

  CustomerRepoImpl({required this.remote, required this.local});

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders() async {
    try {
      final orders = await remote.getOrders();
      await local.cacheOrders(orders);
      return Right(orders);
    } catch (e) {
      try {
        final localOrders = await local.getCachedOrders();
        return Right(localOrders);
      } catch (e2) {
        return Left(ServerFailure(e2.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> getOrderById(String id) async {
    try {
      final order = await remote.getOrderById(id);
      return Right(order);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addOrder(OrderEntity order) async {
    try {
      await remote.addOrder(order);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateOrder(OrderEntity updatedOrder) async {
    try {
      await remote.updateOrder(updatedOrder);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteOrder(String id) async {
    try {
      await remote.deleteOrder(id);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
