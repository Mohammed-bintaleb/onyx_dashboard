import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manger/theme_cubit/theme_cubit.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: DropdownButton<ThemeMode>(
        underline: const SizedBox(),
        isDense: true,
        icon: const SizedBox.shrink(),
        value: Theme.of(context).brightness == Brightness.dark
            ? ThemeMode.dark
            : ThemeMode.light,
        items: const [
          DropdownMenuItem(value: ThemeMode.light, child: Text("Light")),
          DropdownMenuItem(value: ThemeMode.dark, child: Text("Dark")),
        ],
        selectedItemBuilder: (context) => const [
          Icon(Icons.wb_sunny_outlined, size: 24),
          Icon(Icons.nightlight_round, size: 24),
        ],
        onChanged: (mode) {
          if (mode != null) {
            context.read<ThemeCubit>().toggleTheme(mode);
          }
        },
      ),
    );
  }
}
