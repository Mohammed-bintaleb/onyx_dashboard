import 'package:flutter/material.dart';

class ProductTable extends StatefulWidget {
  const ProductTable({super.key});

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
          _buildTableHeader(),
          const SizedBox(height: 8),
          ..._products.map((product) => _buildProductRow(product)),
          _buildAddButton(),
          const SizedBox(height: 16),
          _buildGrandTotal(),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: const Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              'Product Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              'Available',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text('Price', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: Text(
              'Quantity',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildProductRow(ProductRow product) {
    final productData = _productDatabase[product.name]!;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Row(
        children: [
          // Product Name Dropdown
          Expanded(
            flex: 3,
            child: DropdownButton<String>(
              value: product.name,
              items: _productDatabase.keys.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  product.name = newValue!;
                  _calculateTotal();
                });
              },
              isExpanded: true,
              underline: Container(),
            ),
          ),

          // Available
          Expanded(child: Text('${productData.available}')),

          // Price
          Expanded(child: Text('\$${productData.price.toStringAsFixed(2)}')),

          // Quantity Input
          Expanded(
            child: TextFormField(
              initialValue: product.quantity.toString(),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                final newQuantity = int.tryParse(value) ?? 0;
                final maxAvailable = productData.available;

                if (newQuantity <= maxAvailable) {
                  setState(() {
                    product.quantity = newQuantity;
                    _calculateTotal();
                  });
                }
              },
              decoration: const InputDecoration(
                isDense: true,
                border: OutlineInputBorder(),
              ),
            ),
          ),

          // Total
          Expanded(
            child: Text(
              '\$${(productData.price * product.quantity).toStringAsFixed(2)}',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        onPressed: _addProduct,
        icon: const Icon(Icons.add),
        label: const Text('Add Product'),
      ),
    );
  }

  Widget _buildGrandTotal() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Grand Total',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '\$${_grandTotal.toStringAsFixed(2)}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
    setState(() {});
  }
}

class ProductRow {
  String name;
  int quantity;

  ProductRow({required this.name, this.quantity = 1});
}

class ProductData {
  final int available;
  final double price;

  ProductData({required this.available, required this.price});
}
