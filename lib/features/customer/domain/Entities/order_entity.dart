import 'package:hive/hive.dart';

part 'order_entity.g.dart';

@HiveType(typeId: 0)
class OrderEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String customer;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final String status;
  @HiveField(4)
  final double amount;
  @HiveField(5)
  final bool isSynced;
  OrderEntity(
    this.id,
    this.customer,
    this.date,
    this.status,
    this.amount, [
    this.isSynced = true,
  ]);
  OrderEntity copyWith({
    String? id,
    String? customer,
    String? date,
    String? status,
    double? amount,
    bool? isSynced,
  }) {
    return OrderEntity(
      id ?? this.id,
      customer ?? this.customer,
      date ?? this.date,
      status ?? this.status,
      amount ?? this.amount,
      isSynced ?? this.isSynced,
    );
  }
}
