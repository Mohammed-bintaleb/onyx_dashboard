import 'package:flutter/material.dart';

import '../../../domain/Entities/product_data_entity.dart';

class ProductNameDropdown extends StatelessWidget {
  final String selectedName;
  final Map<String, ProductDataEntity> productDatabase;
  final ValueChanged<String> onNameChanged;
  final bool isDarkMode;

  const ProductNameDropdown({
    super.key,
    required this.selectedName,
    required this.productDatabase,
    required this.onNameChanged,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedName,
      items: productDatabase.keys.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
          ),
        );
      }).toList(),
      onChanged: (newValue) {
        if (newValue != null) {
          onNameChanged(newValue);
        }
      },
      isExpanded: true,
      underline: Container(),
      dropdownColor: isDarkMode ? const Color(0xFF1D1E33) : Colors.white,
    );
  }
}
