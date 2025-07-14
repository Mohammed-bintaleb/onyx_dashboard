import 'package:hive/hive.dart';
import '../../domain/Entities/order_entity.dart';
import '../../domain/Entities/product_data_entity.dart';
import '../../domain/Entities/product_row_entity.dart';
import '../models/order_model.dart';
import '../models/product_data_model.dart';
import '../models/product_row_model.dart';

import 'customer_local_data_source.dart';

class CustomerLocalDataSourceImpl implements CustomerLocalDataSource {
  final Box<OrderModel> orderBox;
  final Box<ProductDataModel> productDataBox;
  final Box<ProductRowModel> productRowBox;

  CustomerLocalDataSourceImpl({
    required this.orderBox,
    required this.productDataBox,
    required this.productRowBox,
  });

  @override
  Future<List<OrderEntity>> getCachedOrders() async {
    return orderBox.values.toList();
  }

  @override
  Future<void> cacheOrders(List<OrderEntity> orders) async {
    await orderBox.clear();
    for (var order in orders) {
      await orderBox.put(order.id, order as OrderModel);
    }
  }

  @override
  Future<List<ProductDataEntity>> getCachedProductData() async {
    return productDataBox.values.toList();
  }

  @override
  Future<void> cacheProductData(List<ProductDataEntity> products) async {
    await productDataBox.clear();
    for (var product in products) {
      await productDataBox.add(product as ProductDataModel);
    }
  }

  @override
  Future<List<ProductRowEntity>> getCachedProductRows() async {
    return productRowBox.values.toList();
  }

  @override
  Future<void> cacheProductRows(List<ProductRowEntity> rows) async {
    await productRowBox.clear();
    for (var row in rows) {
      await productRowBox.add(row as ProductRowModel);
    }
  }
}
