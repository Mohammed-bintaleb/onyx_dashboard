// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onyx_dashboard/features/customer/data/models/order_model.dart';
import 'package:onyx_dashboard/features/customer/domain/Entities/order_entity.dart';

import '../../../../constants.dart';
import 'customer_remote_data_source.dart';

class CustomerRemoteDataSourceImpl implements CustomerRemoteDataSource {
  final FirebaseFirestore firestore;

  CustomerRemoteDataSourceImpl(this.firestore);

  CollectionReference get ordersCollection => firestore.collection(kOrderColl);

  @override
  Future<List<OrderEntity>> getOrders() async {
    final snapshot = await ordersCollection.get();
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return OrderModel.fromMap(data);
    }).toList();
  }

  @override
  Future<OrderEntity> getOrderById(String id) async {
    final doc = await ordersCollection.doc(id).get();
    if (doc.exists) {
      return OrderModel.fromMap(doc.data() as Map<String, dynamic>);
    } else {
      throw Exception("Order not found");
    }
  }

  @override
  Future<void> addOrder(OrderEntity order) async {
    final model = OrderModel(
      id: order.id,
      customer: order.customer,
      date: order.date,
      status: order.status,
      amount: order.amount,
      isSynced: true,
    );
    print("🟢 RemoteDataSource: Saving order ${model.id}");
    await ordersCollection.doc(model.id).set(model.toMap());
    print("✅ Order saved to Firestore: ${model.toMap()}");
  }

  @override
  Future<void> updateOrder(OrderEntity order) async {
    final model = OrderModel(
      id: order.id,
      customer: order.customer,
      date: order.date,
      status: order.status,
      amount: order.amount,
      isSynced: order.isSynced,
    );
    await ordersCollection.doc(model.id).update(model.toMap());
  }

  @override
  Future<void> deleteOrder(String id) async {
    await ordersCollection.doc(id).delete();
  }
}
