import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onyx_dashboard/constants.dart';
import 'core/utils/app_view.dart';
import 'core/utils/service_locator.dart';
import 'features/customer/domain/Entities/order_entity.dart';
import 'features/customer/presentation/manger/order_cubit/order_cubit.dart';
import 'features/customer/presentation/manger/product_cubit/product_cubit.dart';
import 'features/home/presentation/manger/language_cubit/language_cubit.dart';
import 'features/home/presentation/manger/theme_cubit/theme_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Hive.initFlutter();

  Hive.registerAdapter(OrderEntityAdapter());

  await Hive.openBox<OrderEntity>(kOrderBox);
  await setupServiceLocator();

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
        BlocProvider(create: (_) => sl<OrderCubit>()),
        BlocProvider(create: (_) => ProductCubit()),
      ],
      child: const AppView(),
    );
  }
}
