import 'package:flutter/material.dart';
import '../../../../../core/utils/app_localizations.dart';

class SearchField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const SearchField({super.key, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: t.translate('search_hint'),
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
