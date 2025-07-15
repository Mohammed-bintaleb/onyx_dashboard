// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repo/customer_repo.dart';

class SyncPendingOrdersUseCase {
  final CustomerRepo repo;

  SyncPendingOrdersUseCase(this.repo);

  Future<Either<Failure, void>> call() async {
    final result = await repo.getUnsyncedOrders();

    return await result.fold((failure) => Left(failure), (orders) async {
      for (var order in orders) {
        final addResult = await repo.addOrder(order);
        await addResult.fold(
          (failure) async {
            failure.message;
          },
          (_) async {
            print('✅ تم رفع الطلب ${order.id} بنجاح إلى Firestore');
            await repo.updateOrderSyncStatus(order.id, true);
          },
        );
      }
      return const Right(null);
    });
  }
}
