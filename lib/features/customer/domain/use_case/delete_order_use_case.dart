import 'package:onyx_dashboard/features/customer/domain/repo/customer_repo.dart';

class DeleteOrderUseCase {
  final CustomerRepo repository;

  DeleteOrderUseCase(this.repository);

  Future<void> execute(String id) {
    return repository.deleteOrder(id);
  }
}
