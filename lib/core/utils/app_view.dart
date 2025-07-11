import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home/presentation/manger/language_cubit/language_cubit.dart';
import '../../features/home/presentation/manger/theme_cubit/theme_cubit.dart';
import 'app_localizations.dart';
import 'app_router.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: router,
              locale: locale,
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              themeMode: themeState.mode,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark().copyWith(
                scaffoldBackgroundColor: const Color(0xFF0A0E21),
                appBarTheme: const AppBarTheme(
                  backgroundColor: Color(0xFF0A0E21),
                ),
                cardColor: const Color(0xFF1D1E33),
                canvasColor: const Color(0xFF0A0E21),
                iconTheme: const IconThemeData(color: Colors.white),
                textTheme: ThemeData.dark().textTheme.apply(
                  bodyColor: Colors.white,
                  displayColor: Colors.white,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
