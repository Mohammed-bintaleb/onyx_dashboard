import 'package:onyx_dashboard/features/customer/domain/Entities/order_entity.dart';
import '../../domain/Entities/product_data_entity.dart';
import '../../domain/Entities/product_row_entity.dart';

abstract class CustomerLocalDataSource {
  Future<List<OrderEntity>> getCachedOrders();
  Future<void> cacheOrders(List<OrderEntity> orders);

  Future<List<ProductDataEntity>> getCachedProductData();
  Future<void> cacheProductData(List<ProductDataEntity> products);

  Future<List<ProductRowEntity>> getCachedProductRows();
  Future<void> cacheProductRows(List<ProductRowEntity> rows);
}
