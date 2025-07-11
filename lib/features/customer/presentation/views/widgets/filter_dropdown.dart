import 'package:flutter/material.dart';

class FilterDropdown extends StatelessWidget {
  final String selectedValue;
  final ValueChanged<String?> onChanged;

  const FilterDropdown({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  static const List<String> statuses = [
    "All Statuses",
    "Completed",
    "Shipped",
    "Canceled",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          isExpanded: true,
          items: statuses
              .map(
                (status) =>
                    DropdownMenuItem(value: status, child: Text(status)),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
