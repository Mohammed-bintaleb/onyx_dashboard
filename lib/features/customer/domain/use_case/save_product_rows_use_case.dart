import 'package:dartz/dartz.dart';
import 'package:onyx_dashboard/core/errors/failure.dart';
import 'package:onyx_dashboard/features/customer/domain/repo/customer_repo.dart';
import '../Entities/product_row_entity.dart';

class SaveProductRowsUseCase {
  final CustomerRepo repository;

  SaveProductRowsUseCase(this.repository);

  Future<Either<Failure, Unit>> call(List<ProductRowEntity> productRows) {
    return repository.saveProductRows(productRows);
  }
}
