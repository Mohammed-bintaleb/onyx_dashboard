import '../../../data/models/product_row.dart';

class ProductState {
  final List<ProductRow> products;
  final double grandTotal;

  ProductState({required this.products, required this.grandTotal});

  ProductState copyWith({List<ProductRow>? products, double? grandTotal}) {
    return ProductState(
      products: products ?? this.products,
      grandTotal: grandTotal ?? this.grandTotal,
    );
  }
}
