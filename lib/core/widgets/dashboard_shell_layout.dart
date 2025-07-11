import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/widgets/custom_app_bar.dart';
import '../../features/home/presentation/views/widgets/custom_drawer.dart';

class DashboardShellLayout extends StatelessWidget {
  final Widget child;
  const DashboardShellLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 800;

    if (isTablet) {
      return Scaffold(
        body: Row(
          children: [
            CustomDrawer(
              currentIndex: _getCurrentIndex(context),
              onItemSelected: (index) => _navigateByIndex(context, index),
            ),
            Expanded(
              child: Column(
                children: [
                  const CustomAppBar(),
                  Expanded(child: child),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        drawer: CustomDrawer(
          currentIndex: _getCurrentIndex(context),
          onItemSelected: (index) {
            _navigateByIndex(context, index);
            Navigator.of(context).pop();
          },
        ),
        body: Column(
          children: [
            const CustomAppBar(),
            Expanded(child: child),
          ],
        ),
      );
    }
  }

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location == '/dashboard') return 0;
    if (location == '/orders') return 1;
    if (location == '/create') return 2;
    return 0;
  }

  void _navigateByIndex(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/dashboard');
        break;
      case 1:
        context.go('/orders');
        break;
      case 2:
        context.go('/create');
        break;
    }
  }
}
