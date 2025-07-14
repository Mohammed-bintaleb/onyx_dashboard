import 'package:onyx_dashboard/features/customer/domain/Entities/order_entity.dart';
import 'package:onyx_dashboard/features/customer/domain/Entities/product_row_entity.dart';

abstract class CustomerLocalDataSource {
  Future<void> cacheOrders(List<OrderEntity> orders);
  Future<List<OrderEntity>> getCachedOrders();

  Future<void> cacheProductRows(List<ProductRowEntity> rows);
  Future<List<ProductRowEntity>> getCachedProductRows();
}
