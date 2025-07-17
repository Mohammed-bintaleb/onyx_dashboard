// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:hive/hive.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/Entities/order_entity.dart';
import 'customer_local_data_source.dart';

class CustomerLocalDataSourceImpl implements CustomerLocalDataSource {
  final Box<OrderEntity> orderBox;

  CustomerLocalDataSourceImpl({required this.orderBox});

  @override
  Future<List<OrderEntity>> getCachedOrders() async {
    final orders = orderBox.values.toList();
    print('📦 جلب الطلبات المحلية: عدد الطلبات = ${orders.length}');
    for (var order in orders) {
      print('Order id: ${order.id}, isSynced: ${order.isSynced}');
      print(
        'Orders count in local data source after app restart: ${orders.length}',
      );
    }
    return orders;
  }

  @override
  Future<void> cacheOrders(List<OrderEntity> orders) async {
    //* احصل على الطلبات غير المتزامنة
    final unsyncedOrders1 = orderBox.values;
    log("${unsyncedOrders1.length} ============== unsyncedOrders1.length");
    final unsyncedOrders = orderBox.values
        .where((order) => !order.isSynced)
        .toList();
    log("${unsyncedOrders.length} ============== unsyncedOrders.length");
    //* احصل على مفاتيح الطلبات المتزامنة فقط
    final syncedKeys = orderBox.keys.where((key) {
      final order = orderBox.get(key);
      return order != null && order.isSynced == true;
    }).toList();

    log("$syncedKeys ============== syncedKeys");
    //* احذف الطلبات المتزامنة فقط
    await orderBox.deleteAll(syncedKeys);
    final unsyncedOrders2 = orderBox.values;
    log("${unsyncedOrders2.length} ============== unsyncedOrders2.length");

    //* أضف الطلبات الجديدة من Firestore بشرط ألا يكون موجود لها id في الطلبات غير المتزامنة
    final unsyncedIds = unsyncedOrders.map((e) => e.id).toSet();

    for (var order in orders) {
      if (!unsyncedIds.contains(order.id)) {
        await orderBox.put(order.id, order);
      }
    }

    for (var order in unsyncedOrders) {
      await orderBox.put(order.id, order);
      await orderBox.flush();
    }

    print(
      '📥 تم حفظ ${orders.length} من الطلبات من السيرفر + ${unsyncedOrders.length} غير متزامنة',
    );
  }

  //* حفظ طلب مفرد محليًا
  @override
  Future<void> saveOrderLocally(OrderEntity order) async {
    await orderBox.put(order.id, order);
    await orderBox.flush();
    // await orderBox.compact();
    final box = Hive.box<OrderEntity>(kOrderBox);
    print('📦 بعد الحفظ: ${box.length}');
    print('💾 حفظ الطلب محلياً: ${order.id}, isSynced: ${order.isSynced}');
    print("📦 عدد الطلبات المحفوظة: ${orderBox.length}");
  }

  //* الحصول على الطلبات غير المتزامنة
  @override
  Future<List<OrderEntity>> getUnsyncedOrders() async {
    return orderBox.values.where((order) => order.isSynced == false).toList();
  }

  //* تحديث طلب موجود
  @override
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
      await orderBox.flush();
    }
  }

  ///* حذف الطلب من local
  @override
  Future<void> deleteOrderLocally(String id) async {
    await orderBox.delete(id);
  }
}
