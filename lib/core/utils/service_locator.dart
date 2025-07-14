import 'package:get_it/get_it.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onyx_dashboard/features/customer/domain/repo/customer_repo.dart';
import 'package:onyx_dashboard/features/customer/presentation/manger/order_cubit/order_cubit.dart';
import '../../features/customer/data/data_source/customer_local_data_source.dart';
import '../../features/customer/data/data_source/customer_remote_data_source.dart';
import '../../features/customer/data/data_source/customer_remote_data_source_impl.dart';
import '../../features/customer/data/data_source/customer_local_data_source_impl.dart';
import '../../features/customer/data/repo/customer_repo_impl.dart';
import '../../features/customer/domain/use_case/add_order_use_case.dart';
import '../../features/customer/domain/use_case/delete_order_use_case.dart';
import '../../features/customer/domain/use_case/get_orders_use_case.dart';
import '../../features/customer/domain/use_case/update_order_use_case.dart';
import 'package:hive/hive.dart';
import '../../features/customer/domain/Entities/order_entity.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  final firestoreInstance = FirebaseFirestore.instance;

  final orderBox = await Hive.openBox<OrderEntity>('orders');

  sl.registerLazySingleton<CustomerRemoteDataSource>(
    () => CustomerRemoteDataSourceImpl(firestoreInstance),
  );

  sl.registerLazySingleton<CustomerLocalDataSource>(
    () => CustomerLocalDataSourceImpl(orderBox: orderBox),
  );

  sl.registerLazySingleton<CustomerRepo>(
    () => CustomerRepoImpl(remote: sl(), local: sl()),
  );

  sl.registerLazySingleton(() => GetOrdersUseCase(sl()));
  sl.registerLazySingleton(() => AddOrderUseCase(sl()));
  sl.registerLazySingleton(() => UpdateOrderUseCase(sl()));
  sl.registerLazySingleton(() => DeleteOrderUseCase(sl()));

  sl.registerFactory(
    () => OrderCubit(
      getOrdersUseCase: sl(),
      addOrderUseCase: sl(),
      updateOrderUseCase: sl(),
      deleteOrderUseCase: sl(),
    ),
  );
}
