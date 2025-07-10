import 'package:flutter/material.dart';

class AddRowButton extends StatelessWidget {
  const AddRowButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.add),
        label: const Text('Add Product'),
      ),
    );
  }
}
