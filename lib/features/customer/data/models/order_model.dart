import '../../domain/Entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required String id,
    required String customer,
    required String date,
    required String status,
    required double amount,
  }) : super(id, customer, date, status, amount);

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] ?? '',
      customer: map['customer'] ?? '',
      date: map['date'] ?? '',
      status: map['status'] ?? '',
      amount: (map['amount'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customer': customer,
      'date': date,
      'status': status,
      'amount': amount,
    };
  }
}
