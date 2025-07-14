import 'package:dartz/dartz.dart';
import 'package:onyx_dashboard/core/errors/failure.dart';
import 'package:onyx_dashboard/features/customer/domain/repo/customer_repo.dart';
import '../Entities/order_entity.dart';

class UpdateOrderUseCase {
  final CustomerRepo repository;

  UpdateOrderUseCase(this.repository);

  Future<Either<Failure, Unit>> call(OrderEntity order) {
    return repository.updateOrder(order);
  }
}
