import 'package:flutter/material.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/app_localizations.dart';

class CustomOrderButton extends StatelessWidget {
  const CustomOrderButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final t = AppLocalizations.of(context)!;

    double fontSize = screenWidth < 400 ? 12 : (screenWidth < 600 ? 14 : 16);
    double iconSize = screenWidth < 400 ? 16 : 20;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 250),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
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
              Icon(Icons.add_circle_outline_outlined, size: iconSize),
              const SizedBox(width: 12),
              Text(
                t.translate('create_new_order'),
                style: AppStyles.styleBold16(
                  context,
                ).copyWith(fontSize: fontSize, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
