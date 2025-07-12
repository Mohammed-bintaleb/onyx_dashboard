import 'package:flutter/material.dart';
import '../../../../../core/utils/app_localizations.dart';

class AddRowButton extends StatelessWidget {
  const AddRowButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.add),
        label: Text(t.translate('add_product')),
      ),
    );
  }
}
