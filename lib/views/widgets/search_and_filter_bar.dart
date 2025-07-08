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
        DropdownButton<String>(
          value: "All Statuses",
          items: const [
            DropdownMenuItem(
              value: "All Statuses",
              child: Text("All Statuses"),
            ),
            DropdownMenuItem(value: "Completed", child: Text("Completed")),
            DropdownMenuItem(value: "Shipped", child: Text("Shipped")),
            DropdownMenuItem(value: "Canceled", child: Text("Canceled")),
          ],
          onChanged: (_) {},
        ),
      ],
    );
  }
}
