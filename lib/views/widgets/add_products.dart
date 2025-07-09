import 'package:flutter/material.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  String? _selectedProduct;
  final List<String> _product = [
    "Super Thing",
    "Gadget Pro",
    "Widget A",
    "Widget B",
    "Ultra Gizmo",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            hintText: "Select product...",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
          ),
          value: _selectedProduct,
          items: _product.map((String product) {
            return DropdownMenuItem<String>(
              value: product,
              child: Text(product),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedProduct = newValue;
            });
          },
          isExpanded: true,
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
