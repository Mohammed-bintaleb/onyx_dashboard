import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/customer/presentation/manger/order_cubit/order_cubit.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is OrderCubit && change.nextState is OrderInitial) {
      bloc.syncPendingOrders();
    }
  }
}
