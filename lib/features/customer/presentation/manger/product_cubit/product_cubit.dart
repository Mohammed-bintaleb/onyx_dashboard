import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/Entities/product_data_entity.dart';
import '../../../domain/Entities/product_row_entity.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState(products: [], grandTotal: 0.0));

  final Map<String, ProductDataEntity> productDatabase = {
    'Super Thing': ProductDataEntity(available: 15, price: 29.99),
    'Gadget Pro': ProductDataEntity(available: 8, price: 49.99),
    'Widget A': ProductDataEntity(available: 20, price: 9.99),
    'Widget B': ProductDataEntity(available: 12, price: 14.99),
    'Ultra Gizmo': ProductDataEntity(available: 5, price: 99.99),
  };

  void addProduct() {
    final newProducts = [...state.products];
    newProducts.add(
      ProductRowEntity(name: productDatabase.keys.first, quantity: 1),
    );
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

  void _updateState(List<ProductRowEntity> updatedProducts) {
    final total = updatedProducts.fold(0.0, (sum, product) {
      final data = productDatabase[product.name]!;
      return sum + (data.price * product.quantity);
    });

    emit(state.copyWith(products: updatedProducts, grandTotal: total));
  }
}
