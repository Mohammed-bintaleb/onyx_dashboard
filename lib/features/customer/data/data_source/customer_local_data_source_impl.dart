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
}
