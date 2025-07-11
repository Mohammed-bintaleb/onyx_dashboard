import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/app_view.dart';
import 'features/home/presentation/manger/language_cubit/language_cubit.dart';
import 'features/home/presentation/manger/theme_cubit/theme_cubit.dart';
import 'features/customer/presentation/manger/product_cubit/product_cubit.dart';

void main() {
  runApp(
    DevicePreview(enabled: false, builder: (context) => const OnyxDashboard()),
  );
}

class OnyxDashboard extends StatelessWidget {
  const OnyxDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LanguageCubit()),
        BlocProvider(create: (_) => ProductCubit()),
      ],
      child: const AppView(),
    );
  }
}
