import 'package:flutter/material.dart';

class SearchAndFilterBar extends StatelessWidget {
  const SearchAndFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search by name or order ID...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 200,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: "All Statuses",
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: "All Statuses",
                    child: Text("All Statuses"),
                  ),
                  DropdownMenuItem(
                    value: "Completed",
                    child: Text("Completed"),
                  ),
                  DropdownMenuItem(value: "Shipped", child: Text("Shipped")),
                  DropdownMenuItem(value: "Canceled", child: Text("Canceled")),
                ],
                onChanged: (_) {
                  // التغيير
                },
              ),
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }
}
