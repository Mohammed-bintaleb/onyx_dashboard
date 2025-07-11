import 'package:onyx_dashboard/features/customer/domain/repo/customer_repo.dart';

import '../Entities/product_data_entity.dart';

class FetchProductDataUseCase {
  final CustomerRepo repository;

  FetchProductDataUseCase(this.repository);

  Future<List<ProductDataEntity>> execute() {
    return repository.fetchProductData();
  }
}
