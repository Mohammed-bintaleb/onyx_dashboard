import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: AppColors.lightBackground,
  cardColor: AppColors.lightCard,
  appBarTheme: const AppBarTheme(backgroundColor: AppColors.lightBackground),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: AppColors.lightText,
    displayColor: AppColors.lightText,
  ),
);

final ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: AppColors.darkBackground,
  cardColor: AppColors.darkCard,
  appBarTheme: const AppBarTheme(backgroundColor: AppColors.darkBackground),
  canvasColor: AppColors.darkBackground,
  iconTheme: const IconThemeData(color: AppColors.darkText),
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: AppColors.darkText,
    displayColor: AppColors.darkText,
  ),
);
