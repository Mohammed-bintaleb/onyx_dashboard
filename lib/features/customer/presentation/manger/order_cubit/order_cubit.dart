// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:onyx_dashboard/features/customer/domain/Entities/order_entity.dart';

import '../../../../../constants.dart';
import '../../../../../core/networking/networking.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/models/order_model.dart';
import '../../../domain/repo/customer_repo.dart';
import '../../../domain/use_case/add_order_use_case.dart';
import '../../../domain/use_case/get_orders_use_case.dart';
import '../../../domain/use_case/sync_pending_orders_use_case.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final GetOrdersUseCase getOrdersUseCase;
  final AddOrderUseCase addOrderUseCase;
  final SyncPendingOrdersUseCase syncPendingOrdersUseCase;

  OrderCubit({
    required this.syncPendingOrdersUseCase,
    required this.getOrdersUseCase,
    required this.addOrderUseCase,
  }) : super(OrderInitial());

  Future<void> fetchOrders() async {
    emit(OrderLoading());
    final networkInfo = sl<Netwokinfo>();

    if (await networkInfo.isConnected) {
      await syncPendingOrders();
    }

    final result = await getOrdersUseCase.call();
    result.fold(
      (failure) => emit(OrderError(failure.message)),
      (orders) => emit(OrderLoaded(orders)),
    );
  }

  Future<void> addOrder(OrderEntity order) async {
    emit(OrderSaving()); // ✅ إعلام الواجهة إننا بنحفظ

    final networkInfo = sl<Netwokinfo>();
    final isConnected = await networkInfo.isConnected;

    if (isConnected) {
      final result = await addOrderUseCase.call(order);
      result.fold(
        (failure) => print('❌ خطأ في رفع الطلب: ${failure.message}'),
        (_) => print('📡 تم رفع الطلب إلى Firestore (متزامن)'),
      );
    } else {
      final unsyncedOrder = (order is OrderModel)
          ? order.copyWith(isSynced: false)
          : OrderModel(
              id: order.id,
              customer: order.customer,
              date: order.date,
              status: order.status,
              amount: order.amount,
              isSynced: false,
            );

      await sl<CustomerRepo>().saveOrderLocally(unsyncedOrder);
      await Hive.box<OrderEntity>(kOrderBox).flush();
      // ✅ flush يضمن الكتابة للقرص

      print('📦 تم حفظ الطلب محليًا كغير متزامن: ${unsyncedOrder.id}');
    }

    emit(OrderSaved()); // ✅ إعلام الواجهة بنجاح الحفظ
    fetchOrders(); // تحديث الطلبات
  }

  Future<void> syncPendingOrders() async {
    final result = await syncPendingOrdersUseCase.call();
    result.fold(
      (failure) => print('❌ فشل مزامنة الطلبات: ${failure.message}'),
      (_) => print('✅ تمت مزامنة الطلبات وحذفها من Hive'),
    );
  }
}
