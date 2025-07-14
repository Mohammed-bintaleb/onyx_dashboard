import 'package:dartz/dartz.dart';
import 'package:onyx_dashboard/core/errors/failure.dart';
import 'package:onyx_dashboard/features/customer/domain/repo/customer_repo.dart';
import '../Entities/order_entity.dart';

class GetOrdersUseCase {
  final CustomerRepo repository;

  GetOrdersUseCase(this.repository);

  Future<Either<Failure, List<OrderEntity>>> execute() {
    return repository.getOrders();
  }
}
