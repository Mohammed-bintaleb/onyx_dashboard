import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onyx_dashboard/core/utils/app_localizations.dart';
import 'package:onyx_dashboard/features/home/presentation/views/dash_board_view.dart';
import 'package:onyx_dashboard/features/home/presentation/manger/language_cubit/language_cubit.dart';
import 'package:onyx_dashboard/features/home/presentation/manger/theme_cubit/theme_cubit.dart';

void main() {
  runApp(const OnyxDashbord());
}

class OnyxDashbord extends StatelessWidget {
  const OnyxDashbord({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LanguageCubit()),
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                locale: locale,
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                themeMode: state.mode,
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
                home: const DashBoardView(),
              );
            },
          );
        },
      ),
    );
  }
}
