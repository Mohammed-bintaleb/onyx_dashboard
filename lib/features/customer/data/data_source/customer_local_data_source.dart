import 'package:onyx_dashboard/features/customer/domain/Entities/order_entity.dart';

abstract class CustomerLocalDataSource {
  Future<List<OrderEntity>> getCachedOrders();
  Future<void> cacheOrders(List<OrderEntity> orders);
}
