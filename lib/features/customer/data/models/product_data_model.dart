import '../../domain/Entities/product_data_entity.dart';

class ProductDataModel extends ProductDataEntity {
  ProductDataModel({required int available, required double price})
    : super(available: available, price: price);

  factory ProductDataModel.fromMap(Map<String, dynamic> map) {
    return ProductDataModel(
      available: map['available'] ?? 0,
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {'available': available, 'price': price};
  }
}
