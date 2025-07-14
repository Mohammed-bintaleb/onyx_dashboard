import 'package:onyx_dashboard/features/customer/domain/Entities/order_entity.dart';
import '../../domain/Entities/product_data_entity.dart';
import '../../domain/Entities/product_row_entity.dart';

abstract class CustomerRemoteDataSource {
  Future<List<OrderEntity>> getOrders();
  Future<OrderEntity> getOrderById(String id);
  Future<void> addOrder(OrderEntity order);
  Future<void> updateOrder(OrderEntity order);
  Future<void> deleteOrder(String id);
  Future<List<ProductDataEntity>> fetchProductData();
  Future<void> saveProductRows(List<ProductRowEntity> productRows);
  Future<List<ProductRowEntity>> fetchProductRows();
}
