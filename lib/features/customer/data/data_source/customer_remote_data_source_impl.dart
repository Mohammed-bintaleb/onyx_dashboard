import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onyx_dashboard/features/customer/data/models/order_model.dart';
import 'package:onyx_dashboard/features/customer/data/models/product_data_model.dart';
import 'package:onyx_dashboard/features/customer/data/models/product_row_model.dart';
import 'package:onyx_dashboard/features/customer/domain/Entities/order_entity.dart';
import 'package:onyx_dashboard/features/customer/domain/Entities/product_data_entity.dart';
import 'package:onyx_dashboard/features/customer/domain/Entities/product_row_entity.dart';

import '../../../../constants.dart';
import 'customer_remote_data_source.dart';

class CustomerRemoteDataSourceImpl implements CustomerRemoteDataSource {
  final FirebaseFirestore firestore;

  CustomerRemoteDataSourceImpl(this.firestore);

  CollectionReference get ordersCollection => firestore.collection(kOrderColl);
  CollectionReference get productsCollection =>
      firestore.collection(kProductsColl);
  CollectionReference get productRowsCollection =>
      firestore.collection(kProductRowsColl);

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
    final model = order as OrderModel;
    await ordersCollection.doc(model.id).set(model.toMap());
  }

  @override
  Future<void> updateOrder(OrderEntity order) async {
    final model = order as OrderModel;
    await ordersCollection.doc(model.id).update(model.toMap());
  }

  @override
  Future<void> deleteOrder(String id) async {
    await ordersCollection.doc(id).delete();
  }

  @override
  Future<List<ProductDataEntity>> fetchProductData() async {
    final snapshot = await productsCollection.get();
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return ProductDataModel.fromMap(data);
    }).toList();
  }

  @override
  Future<void> saveProductRows(List<ProductRowEntity> productRows) async {
    for (var row in productRows) {
      final model = row as ProductRowModel;
      await productRowsCollection.doc(model.name).set(model.toMap());
    }
  }

  @override
  Future<List<ProductRowEntity>> fetchProductRows() async {
    final snapshot = await productRowsCollection.get();
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return ProductRowModel.fromMap(data);
    }).toList();
  }
}
