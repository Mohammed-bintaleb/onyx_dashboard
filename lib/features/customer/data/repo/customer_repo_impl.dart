import 'package:dartz/dartz.dart';
import 'package:onyx_dashboard/core/errors/failure.dart';
import 'package:onyx_dashboard/features/customer/domain/Entities/order_entity.dart';
import 'package:onyx_dashboard/features/customer/domain/Entities/product_data_entity.dart';
import 'package:onyx_dashboard/features/customer/domain/Entities/product_row_entity.dart';

import '../../domain/repo/customer_repo.dart';

class CustomerRepoImpl implements CustomerRepo {
  final List<OrderEntity> _orders = [];
  final List<ProductDataEntity> _productData = [];
  final List<ProductRowEntity> _productRows = [];

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders() async {
    try {
      return Right(_orders);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> getOrderById(String id) async {
    try {
      final order = _orders.firstWhere((order) => order.id == id);
      return Right(order);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addOrder(OrderEntity order) async {
    try {
      _orders.add(order);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateOrder(OrderEntity updatedOrder) async {
    try {
      final index = _orders.indexWhere((order) => order.id == updatedOrder.id);
      if (index == -1) {
        return Left(ServerFailure("الطلب غير موجود"));
      }
      _orders[index] = updatedOrder;
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteOrder(String id) async {
    try {
      _orders.removeWhere((order) => order.id == id);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductDataEntity>>> fetchProductData() async {
    try {
      return Right(_productData);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveProductRows(
    List<ProductRowEntity> productRows,
  ) async {
    try {
      _productRows.clear();
      _productRows.addAll(productRows);
      return const Right(unit);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductRowEntity>>> fetchProductRows() async {
    try {
      return Right(_productRows);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
