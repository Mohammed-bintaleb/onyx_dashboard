import 'package:flutter/material.dart';

class PaginationButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isEnabled;
  final bool isPressed;
  final VoidCallback onPressed;

  const PaginationButton({
    super.key,
    required this.icon,
    required this.label,
    required this.isEnabled,
    required this.isPressed,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(icon, size: 18),
      label: Text(label),
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (isPressed) return Colors.white;
          return isEnabled ? Colors.black : Colors.grey;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (isPressed) return Colors.green;
          return Colors.transparent;
        }),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
      ),
    );
  }
}
