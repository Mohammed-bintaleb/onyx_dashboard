import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/language_cubit/language_cubit.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;

    return SizedBox(
      width: 50,
      child: DropdownButton<String>(
        underline: const SizedBox(),
        isDense: true,
        icon: const SizedBox.shrink(),
        value: locale,
        items: const [
          DropdownMenuItem(value: 'en', child: Text('English')),
          DropdownMenuItem(value: 'ar', child: Text('العربية')),
        ],
        selectedItemBuilder: (context) => const [
          Icon(Icons.language, size: 24),
          Icon(Icons.language, size: 24),
        ],
        onChanged: (langCode) {
          if (langCode != null) {
            context.read<LanguageCubit>().changeLanguage(langCode);
          }
        },
      ),
    );
  }
}
