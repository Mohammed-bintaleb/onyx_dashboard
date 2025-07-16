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
        final remoteOrders = await remote.getOrders();
        await local.cacheOrders(remoteOrders);
        //* جلب الطلبات غير المتزامنة المحفوظة محليًا
        final unsyncedOrders = await local.getUnsyncedOrders();
        //* دمج القائمتين بحيث الطلبات المحلية الغير متزامنة تظهر مع الطلبات المزامنة
        final allOrders = [...remoteOrders];
        //* تأكد أن الطلبات الغير متزامنة ليست مكررة في القائمة النهائية تجنب التكرار حسب id
        for (var unsynced in unsyncedOrders) {
          final exists = allOrders.any((o) => o.id == unsynced.id);
          if (!exists) {
            allOrders.add(unsynced);
          }
        }
        return Right(allOrders);
      } catch (e) {
        print("⚠️ Failed to fetch from REMOTE, trying LOCAL");
        try {
          final localOrders = await local.getCachedOrders();
          return Right(localOrders);
        } catch (e2) {
          return Left(ServerFailure("Local Error: ${e2.toString()}"));
        }
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
  Future<Either<Failure, Unit>> addOrder(OrderEntity order) async {
    final isConnected = await networkInfo.isConnected;
    print('🌐 isConnected = $isConnected');

    if (isConnected) {
      try {
        print('🚀 محاولة رفع الطلب إلى Firestore...');
        await remote.addOrder(order);

        final syncedOrder = order.copyWith(isSynced: true);
        await local.saveOrderLocally(syncedOrder);
        print('✅ تم رفع الطلب وحفظه كمزامن: ${order.id}');
        return const Right(unit);
      } catch (e) {
        print(
          '❌ فشل الرفع إلى Firestore، حفظه محليًا كـ غير متزامن: ${order.id}',
        );
        final unsyncedOrder = order.copyWith(isSynced: false);
        await local.saveOrderLocally(unsyncedOrder);
        return const Right(unit);
      }
    } else {
      print(
        '📴 لا يوجد اتصال، سيتم حفظ الطلب محليًا كـ غير متزامن: ${order.id}',
      );
      final unsyncedOrder = order.copyWith(isSynced: false);
      await local.saveOrderLocally(unsyncedOrder);
      return const Right(unit);
    }
  }

  @override
  Future<Either<Failure, Unit>> syncPendingOrders() async {
    try {
      final unsyncedOrders = await local.getUnsyncedOrders();
      for (var order in unsyncedOrders) {
        try {
          await remote.addOrder(order); //* رفع الطلب للـ Firestore
          await local.updateOrderSyncStatus(
            order.id,
            true,
          ); //* تحديث الحالة محليًا
          print('✅ تم مزامنة الطلب ${order.id}');
        } catch (e) {
          print('❌ فشل مزامنة الطلب ${order.id}: $e');
        }
      }
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure("Sync Failed: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getUnsyncedOrders() async {
    try {
      final result = await local.getUnsyncedOrders();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteOrderLocally(String id) async {
    try {
      await local.deleteOrderLocally(id);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateOrderSyncStatus(
    String id,
    bool isSynced,
  ) async {
    try {
      await local.updateOrderSyncStatus(id, isSynced);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveOrderLocally(OrderEntity order) async {
    try {
      await local.saveOrderLocally(order);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
