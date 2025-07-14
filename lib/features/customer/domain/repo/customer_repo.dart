import 'package:onyx_dashboard/features/customer/domain/Entities/order_entity.dart';
import '../Entities/product_data_entity.dart';
import '../Entities/product_row_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class CustomerRepo {
  Future<Either<Failure, List<OrderEntity>>> getOrders();
  Future<Either<Failure, OrderEntity>> getOrderById(String id);
  Future<Either<Failure, Unit>> addOrder(OrderEntity order);
  Future<Either<Failure, Unit>> updateOrder(OrderEntity order);
  Future<Either<Failure, Unit>> deleteOrder(String id);
  Future<Either<Failure, List<ProductDataEntity>>> fetchProductData();
  Future<Either<Failure, Unit>> saveProductRows(
    List<ProductRowEntity> productRows,
  );
  Future<Either<Failure, List<ProductRowEntity>>> fetchProductRows();
}
