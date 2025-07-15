import 'package:onyx_dashboard/features/customer/domain/Entities/order_entity.dart';

abstract class CustomerLocalDataSource {
  Future<List<OrderEntity>> getCachedOrders();
  Future<void> cacheOrders(List<OrderEntity> orders);
  Future<void> saveOrderLocally(OrderEntity order);
  Future<List<OrderEntity>> getUnsyncedOrders();
  Future<void> updateOrderSyncStatus(String id, bool isSynced);
  Future<void> deleteOrderLocally(String id);
}
