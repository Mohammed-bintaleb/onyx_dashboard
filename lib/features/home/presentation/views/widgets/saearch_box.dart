import 'package:flutter/material.dart';
import 'package:onyx_dashboard/core/extensions/context_extensions.dart';

import '../../../../../core/theme/app_colors.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    return Container(
      height: 40,
      width: 400,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkBackground : AppColors.lightCard,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.grey, size: 20),
          Expanded(
            child: TextField(
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                isCollapsed: true,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                border: InputBorder.none,
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
