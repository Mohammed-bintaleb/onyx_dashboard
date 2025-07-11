import 'package:flutter/material.dart';

class ProductQuantityInput extends StatelessWidget {
  final int quantity;
  final int maxAvailable;
  final ValueChanged<int> onQuantityChanged;
  final bool isDarkMode;

  const ProductQuantityInput({
    super.key,
    required this.quantity,
    required this.maxAvailable,
    required this.onQuantityChanged,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: quantity.toString(),
      keyboardType: TextInputType.number,
      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
      onChanged: (value) {
        final newQuantity = int.tryParse(value) ?? 0;
        if (newQuantity <= maxAvailable) {
          onQuantityChanged(newQuantity);
        }
      },
      decoration: InputDecoration(
        isDense: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: isDarkMode ? Colors.grey[700]! : Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isDarkMode ? Colors.blue[300]! : Colors.blue,
          ),
        ),
        fillColor: isDarkMode ? const Color(0xFF2A2D43) : Colors.white,
        filled: true,
      ),
    );
  }
}
