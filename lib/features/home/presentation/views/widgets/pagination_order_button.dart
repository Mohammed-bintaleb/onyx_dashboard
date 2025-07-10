import 'package:flutter/material.dart';

class PaginationButton extends StatelessWidget {
  final bool isPressed;
  final VoidCallback? onPressed;
  final IconData icon;
  final String label;

  const PaginationButton({
    super.key,
    required this.isPressed,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: _buttonStyle(isPressed),
    );
  }

  ButtonStyle _buttonStyle(bool isPressed) {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return Colors.grey.shade300;
        }
        return isPressed ? Colors.green : Colors.grey;
      }),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
