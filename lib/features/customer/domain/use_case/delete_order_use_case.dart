import 'package:dartz/dartz.dart';
import 'package:onyx_dashboard/core/errors/failure.dart';
import 'package:onyx_dashboard/features/customer/domain/repo/customer_repo.dart';

class DeleteOrderUseCase {
  final CustomerRepo repository;

  DeleteOrderUseCase(this.repository);

  Future<Either<Failure, Unit>> call(String id) {
    return repository.deleteOrder(id);
  }
}
