import 'package:flutter/material.dart';

import 'filter_dropdown.dart';
import 'search_field.dart';

class SearchAndFilterBar extends StatelessWidget {
  final TextEditingController? searchController;
  final ValueChanged<String>? onSearchChanged;
  final String selectedFilter;
  final ValueChanged<String?> onFilterChanged;

  const SearchAndFilterBar({
    super.key,
    this.searchController,
    this.onSearchChanged,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 600;

        if (isWide) {
          return Row(
            children: [
              Expanded(
                child: SearchField(
                  controller: searchController,
                  onChanged: onSearchChanged,
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: 200,
                child: FilterDropdown(
                  selectedValue: selectedFilter,
                  onChanged: onFilterChanged,
                ),
              ),
              const Spacer(),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SearchField(
                controller: searchController,
                onChanged: onSearchChanged,
              ),
              const SizedBox(height: 16),
              FilterDropdown(
                selectedValue: selectedFilter,
                onChanged: onFilterChanged,
              ),
            ],
          );
        }
      },
    );
  }
}
