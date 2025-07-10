import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(mode: ThemeMode.light));

  void toggleTheme(ThemeMode mode) {
    emit(ThemeState(mode: mode));
  }

  void switchTheme() {
    final isDark = state.mode == ThemeMode.dark;
    emit(ThemeState(mode: isDark ? ThemeMode.light : ThemeMode.dark));
  }
}
