import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:onyx_dashboard/features/customer/domain/repo/customer_repo.dart';
import 'package:onyx_dashboard/features/customer/presentation/manger/order_cubit/order_cubit.dart';
import '../../features/customer/data/data_source/customer_local_data_source.dart';
import '../../features/customer/data/data_source/customer_remote_data_source.dart';
import '../../features/customer/data/data_source/customer_remote_data_source_impl.dart';
import '../../features/customer/data/data_source/customer_local_data_source_impl.dart';
import '../../features/customer/data/repo/customer_repo_impl.dart';
import '../../features/customer/domain/use_case/add_order_use_case.dart';
import '../../features/customer/domain/use_case/get_orders_use_case.dart';
import '../../features/customer/domain/use_case/sync_pending_orders_use_case.dart';
import 'package:hive/hive.dart';
import '../../features/customer/domain/Entities/order_entity.dart';
import '../networking/internet_connection_checker.dart';
import '../networking/networking.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator(Box<OrderEntity> orderBox) async {
  final firestoreInstance = FirebaseFirestore.instance;

  sl.registerLazySingleton<CustomerLocalDataSource>(
    () => CustomerLocalDataSourceImpl(orderBox: orderBox),
  );

  sl.registerLazySingleton<CustomerRemoteDataSource>(
    () => CustomerRemoteDataSourceImpl(firestoreInstance),
  );

  sl.registerLazySingleton<CustomerRepo>(
    () => CustomerRepoImpl(remote: sl(), local: sl(), networkInfo: sl()),
  );

  sl.registerLazySingleton(() => SyncPendingOrdersUseCase(sl()));

  sl.registerLazySingleton(() => GetOrdersUseCase(sl()));
  sl.registerLazySingleton(() => AddOrderUseCase(sl()));

  sl.registerFactory(
    () => OrderCubit(
      getOrdersUseCase: sl(),
      addOrderUseCase: sl(),
      syncPendingOrdersUseCase: sl(),
    ),
  );

  sl.registerLazySingleton(() => InternetConnectionChecker.instance);
  sl.registerLazySingleton<Netwokinfo>(() => NetworkIfnoImpl(sl()));
}
