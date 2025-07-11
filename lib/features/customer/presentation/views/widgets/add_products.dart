import 'package:flutter/material.dart';
import 'package:onyx_dashboard/features/customer/presentation/views/widgets/add_row_button.dart';
import '../../../data/models/product_data.dart';
import '../../../data/models/product_row.dart';
import 'add_product_table_header.dart';
import 'product_row.dart';
import 'grand_total.dart';

class ProductTable extends StatefulWidget {
  const ProductTable({
    super.key,
    required this.onContinue,
    required this.onProductsUpdated,
  });
  final VoidCallback onContinue;
  final Function(List<ProductRow> products, double grandTotal)
  onProductsUpdated;

  @override
  State<ProductTable> createState() => _ProductTableState();
}

class _ProductTableState extends State<ProductTable> {
  final List<ProductRow> _products = [];
  double _grandTotal = 0.0;

  final Map<String, ProductData> _productDatabase = {
    'Super Thing': ProductData(available: 15, price: 29.99),
    'Gadget Pro': ProductData(available: 8, price: 49.99),
    'Widget A': ProductData(available: 20, price: 9.99),
    'Widget B': ProductData(available: 12, price: 14.99),
    'Ultra Gizmo': ProductData(available: 5, price: 99.99),
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const TableHeader(),
          ..._products.map(
            (product) => ProductRowWidget(
              product: product,
              productDatabase: _productDatabase,
              onNameChanged: (newName) {
                setState(() {
                  product.name = newName;
                  _calculateTotal();
                });
              },
              onQuantityChanged: (newQuantity) {
                setState(() {
                  product.quantity = newQuantity;
                  _calculateTotal();
                });
              },
            ),
          ),
          GrandTotal(grandTotal: _grandTotal),
          const SizedBox(height: 16),
          AddRowButton(onPressed: _addProduct),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _calculateTotal();
              widget.onContinue();
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  void _addProduct() {
    setState(() {
      _products.add(ProductRow(name: _productDatabase.keys.first, quantity: 1));
    });
  }

  void _calculateTotal() {
    _grandTotal = _products.fold(0.0, (sum, product) {
      final productData = _productDatabase[product.name]!;
      return sum + (productData.price * product.quantity);
    });
    setState(() {
      widget.onProductsUpdated(_products, _grandTotal);
    });
  }
}
