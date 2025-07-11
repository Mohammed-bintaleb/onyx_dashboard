import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomOrderButton extends StatelessWidget {
  const CustomOrderButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 250),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 3,
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add_circle_outline_outlined, size: 24),
              SizedBox(width: 12),
              Text(
                'Create New Order',
                style: AppStyles.styleBold16(
                  context,
                ).copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
