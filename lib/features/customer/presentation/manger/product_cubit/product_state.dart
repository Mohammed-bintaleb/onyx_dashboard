import '../../../domain/Entities/product_row_entity.dart';

class ProductState {
  final List<ProductRowEntity> products;
  final double grandTotal;

  ProductState({required this.products, required this.grandTotal});

  ProductState copyWith({
    List<ProductRowEntity>? products,
    double? grandTotal,
  }) {
    return ProductState(
      products: products ?? this.products,
      grandTotal: grandTotal ?? this.grandTotal,
    );
  }
}
