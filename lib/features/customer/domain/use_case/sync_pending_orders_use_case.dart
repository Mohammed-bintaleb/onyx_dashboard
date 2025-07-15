import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repo/customer_repo.dart';

class SyncPendingOrdersUseCase {
  final CustomerRepo repo;

  SyncPendingOrdersUseCase(this.repo);

  Future<Either<Failure, Unit>> call() async {
    try {
      await repo.syncPendingOrders();
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
