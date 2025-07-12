import 'package:flutter/material.dart';

import '../../../../../core/utils/app_localizations.dart';

class FilterDropdown extends StatelessWidget {
  final String selectedValue;
  final ValueChanged<String?> onChanged;

  const FilterDropdown({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  static const List<String> statusKeys = [
    "All Statuses",
    "completed",
    "shipped",
    "canceled",
    "pending",
  ];

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

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
          items: statusKeys
              .map(
                (key) =>
                    DropdownMenuItem(value: key, child: Text(t.translate(key))),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
