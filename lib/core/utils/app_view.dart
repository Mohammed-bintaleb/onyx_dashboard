import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/presentation/manger/language_cubit/language_cubit.dart';
import '../../features/home/presentation/manger/theme_cubit/theme_cubit.dart';
import 'app_localizations.dart';
import 'app_router.dart';
import '../theme/app_theme.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp.router(
              builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              routerConfig: router,
              locale: locale,
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              themeMode: themeState.mode,
              theme: lightTheme,
              darkTheme: darkTheme,
            );
          },
        );
      },
    );
  }
}
