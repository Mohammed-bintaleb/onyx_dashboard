// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:onyx_dashboard/core/errors/failure.dart';
import 'package:onyx_dashboard/features/customer/domain/Entities/order_entity.dart';
import 'package:onyx_dashboard/features/customer/domain/repo/customer_repo.dart';

import '../../../../core/networking/networking.dart';
import '../data_source/customer_local_data_source.dart';
import '../data_source/customer_remote_data_source.dart';

class CustomerRepoImpl implements CustomerRepo {
  final CustomerRemoteDataSource remote;
  final CustomerLocalDataSource local;
  final Netwokinfo networkInfo;

  CustomerRepoImpl({
    required this.networkInfo,
    required this.remote,
    required this.local,
  });

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders() async {
    if (await networkInfo.isConnected) {
      try {
        print("📡 Fetching orders from REMOTE");
        final orders = await remote.getOrders();
        await local.cacheOrders(orders);
        return Right(orders);
      } catch (e) {
        print("⚠️ Failed to fetch from REMOTE, trying LOCAL");
        return Left(ServerFailure("Remote Error: ${e.toString()}"));
      }
    } else {
      print("📦 Offline - fetching orders from LOCAL");
      try {
        final localOrders = await local.getCachedOrders();
        return Right(localOrders);
      } catch (e2) {
        return Left(ServerFailure("Local Error: ${e2.toString()}"));
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
    if (await networkInfo.isConnected) {
      try {
        await remote.addOrder(order);
        //* حفظه كمزامَن
        final syncedOrder = OrderEntity(
          order.id,
          order.customer,
          order.date,
          order.status,
          order.amount,
          true,
        );
        await local.saveOrderLocally(syncedOrder);
        return const Right(unit);
      } catch (e) {
        //* في حال فشل الرفع نحفظه كغير متزامن
        final unsyncedOrder = OrderEntity(
          order.id,
          order.customer,
          order.date,
          order.status,
          order.amount,
          false,
        );
        await local.saveOrderLocally(unsyncedOrder);
        return const Right(unit);
      }
    } else {
      //* إذا مافي نت نحفظه كـ unsynced
      final unsyncedOrder = OrderEntity(
        order.id,
        order.customer,
        order.date,
        order.status,
        order.amount,
        false,
      );
      await local.saveOrderLocally(unsyncedOrder);
      return const Right(unit);
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
  Future<void> syncPendingOrders() async {
    final unsyncedOrders = await local.getUnsyncedOrders();
    for (var order in unsyncedOrders) {
      try {
        await remote.addOrder(order);
        await local.updateOrderSyncStatus(order.id, true);
      } catch (e) {
        print("Failed to sync order ${order.id}: $e");
      }
    }
  }
}
