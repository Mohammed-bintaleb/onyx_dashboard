import 'package:onyx_dashboard/features/customer/domain/repo/customer_repo.dart';
import '../Entities/product_row_entity.dart';

class SaveProductRowsUseCase {
  final CustomerRepo repository;

  SaveProductRowsUseCase(this.repository);

  Future<void> execute(List<ProductRowEntity> productRows) {
    return repository.saveProductRows(productRows);
  }
}
