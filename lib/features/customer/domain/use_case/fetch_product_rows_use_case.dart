import 'package:dartz/dartz.dart';
import 'package:onyx_dashboard/core/errors/failure.dart';
import 'package:onyx_dashboard/features/customer/domain/repo/customer_repo.dart';
import '../Entities/product_row_entity.dart';

class FetchProductRowsUseCase {
  final CustomerRepo repository;

  FetchProductRowsUseCase(this.repository);

  Future<Either<Failure, List<ProductRowEntity>>> execute() {
    return repository.fetchProductRows();
  }
}
