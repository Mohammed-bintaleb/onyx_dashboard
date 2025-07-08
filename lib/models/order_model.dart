enum OrderStatus { pending, shipped, completed, canceled }

class OrderModel {
  final String id;
  final String customer;
  final String date;
  final OrderStatus status;
  final double amount;

  OrderModel({
    required this.id,
    required this.customer,
    required this.date,
    required this.status,
    required this.amount,
  });
}
