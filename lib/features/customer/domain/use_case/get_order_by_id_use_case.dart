import 'package:onyx_dashboard/features/customer/domain/repo/customer_repo.dart';
import '../Entities/order_entity.dart';

class GetOrderByIdUseCase {
  final CustomerRepo repository;

  GetOrderByIdUseCase(this.repository);

  Future<OrderEntity> execute(String id) {
    return repository.getOrderById(id);
  }
}
