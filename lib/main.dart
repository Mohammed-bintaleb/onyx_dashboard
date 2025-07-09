import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onyx_dashboard/views/dash_board_view.dart';
import 'package:onyx_dashboard/views/manger/theme_cubit/theme_cubit.dart';

void main() {
  runApp(const OnyxDashbord());
}

class OnyxDashbord extends StatelessWidget {
  const OnyxDashbord({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
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
      ),
    );
  }
}
