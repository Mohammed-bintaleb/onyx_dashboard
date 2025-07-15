import 'package:hive/hive.dart';
import '../../domain/Entities/order_entity.dart';
import 'customer_local_data_source.dart';

class CustomerLocalDataSourceImpl implements CustomerLocalDataSource {
  final Box<OrderEntity> orderBox;

  CustomerLocalDataSourceImpl({required this.orderBox});

  @override
  Future<List<OrderEntity>> getCachedOrders() async {
    return orderBox.values.toList();
  }

  @override
  Future<void> cacheOrders(List<OrderEntity> orders) async {
    await orderBox.clear();
    for (var order in orders) {
      await orderBox.put(order.id, order);
    }
  }

  //* حفظ طلب مفرد محليًا
  Future<void> saveOrderLocally(OrderEntity order) async {
    await orderBox.put(order.id, order);
  }

  ///* الحصول على الطلبات غير المتزامنة
  Future<List<OrderEntity>> getUnsyncedOrders() async {
    return orderBox.values.where((order) => order.isSynced == false).toList();
  }

  ///* تحديث طلب موجود
  Future<void> updateOrderSyncStatus(String id, bool isSynced) async {
    final order = orderBox.get(id);
    if (order != null) {
      final updated = OrderEntity(
        order.id,
        order.customer,
        order.date,
        order.status,
        order.amount,
        isSynced,
      );
      await orderBox.put(id, updated);
    }
  }

  ///* حذف الطلب من local
  Future<void> deleteOrderLocally(String id) async {
    await orderBox.delete(id);
  }
}
