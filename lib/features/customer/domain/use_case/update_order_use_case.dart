import 'package:onyx_dashboard/features/customer/domain/repo/customer_repo.dart';
import '../Entities/order_entity.dart';

class UpdateOrderUseCase {
  final CustomerRepo repository;

  UpdateOrderUseCase(this.repository);

  Future<void> execute(OrderEntity order) {
    return repository.updateOrder(order);
  }
}
