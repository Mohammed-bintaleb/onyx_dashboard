import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product_data.dart';
import '../../../data/models/product_row.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState(products: [], grandTotal: 0.0));

  final Map<String, ProductData> productDatabase = {
    'Super Thing': ProductData(available: 15, price: 29.99),
    'Gadget Pro': ProductData(available: 8, price: 49.99),
    'Widget A': ProductData(available: 20, price: 9.99),
    'Widget B': ProductData(available: 12, price: 14.99),
    'Ultra Gizmo': ProductData(available: 5, price: 99.99),
  };

  void addProduct() {
    final newProducts = [...state.products];
    newProducts.add(ProductRow(name: productDatabase.keys.first, quantity: 1));
    _updateState(newProducts);
  }

  void updateProductName(int index, String newName) {
    final updated = [...state.products];
    updated[index].name = newName;
    _updateState(updated);
  }

  void updateQuantity(int index, int quantity) {
    final updated = [...state.products];
    updated[index].quantity = quantity;
    _updateState(updated);
  }

  void _updateState(List<ProductRow> updatedProducts) {
    final total = updatedProducts.fold(0.0, (sum, product) {
      final data = productDatabase[product.name]!;
      return sum + (data.price * product.quantity);
    });

    emit(state.copyWith(products: updatedProducts, grandTotal: total));
  }
}
