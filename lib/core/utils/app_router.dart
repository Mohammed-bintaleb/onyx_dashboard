import 'package:go_router/go_router.dart';

import '../../features/customer/presentation/views/create_order_view.dart';
import '../../features/customer/presentation/views/customer_orders_view.dart';
import '../../features/home/presentation/views/widgets/dashboard_content.dart';
import '../widgets/dashboard_shell_layout.dart';

final GoRouter router = GoRouter(
  initialLocation: '/dashboard',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return DashboardShellLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => const DashboardContent(),
        ),
        GoRoute(
          path: '/orders',
          builder: (context, state) =>
              CustomerOrdersView(onCreatePassed: () => context.go('/create')),
        ),
        GoRoute(
          path: '/create',
          builder: (context, state) => const CreateOrderView(),
        ),
      ],
    ),
  ],
);
