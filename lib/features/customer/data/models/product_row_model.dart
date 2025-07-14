import '../../domain/Entities/product_row_entity.dart';

class ProductRowModel extends ProductRowEntity {
  ProductRowModel({required String name, int quantity = 1})
    : super(name: name, quantity: quantity);

  factory ProductRowModel.fromMap(Map<String, dynamic> map) {
    return ProductRowModel(
      name: map['name'] ?? '',
      quantity: map['quantity'] ?? 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'quantity': quantity};
  }
}
