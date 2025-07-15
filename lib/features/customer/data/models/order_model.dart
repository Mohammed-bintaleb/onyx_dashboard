import '../../domain/Entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required String id,
    required String customer,
    required String date,
    required String status,
    required double amount,
    bool isSynced = true,
  }) : super(id, customer, date, status, amount, isSynced);

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] ?? '',
      customer: map['customer'] ?? '',
      date: map['date'] ?? '',
      status: map['status'] ?? '',
      amount: (map['amount'] as num?)?.toDouble() ?? 0.0,
      isSynced: map['isSynced'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'customer': customer,
      'date': date,
      'status': status,
      'amount': amount,
      'isSynced': isSynced,
    };
  }

  //* نسخ الكائن مع تغيير بعض القيم
  OrderModel copyWith({
    String? id,
    String? customer,
    String? date,
    String? status,
    double? amount,
    bool? isSynced,
  }) {
    return OrderModel(
      id: id ?? this.id,
      customer: customer ?? this.customer,
      date: date ?? this.date,
      status: status ?? this.status,
      amount: amount ?? this.amount,
      isSynced: isSynced ?? this.isSynced,
    );
  }
}
