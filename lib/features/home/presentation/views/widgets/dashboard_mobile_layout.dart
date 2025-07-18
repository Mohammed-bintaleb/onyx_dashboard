// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import 'custom_app_bar.dart';
// import 'custom_drawer.dart';

// class DashboardMobileLayout extends StatelessWidget {
//   final Widget child;
//   const DashboardMobileLayout({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     final currentIndex = _getCurrentIndex(context);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: Builder(
//           builder: (context) => IconButton(
//             icon: const Icon(Icons.menu, color: Colors.black),
//             onPressed: () => Scaffold.of(context).openDrawer(),
//           ),
//         ),
//       ),
//       drawer: CustomDrawer(
//         currentIndex: currentIndex,
//         onItemSelected: (index) {
//           _navigateByIndex(context, index);
//           Navigator.of(context).pop();
//         },
//       ),
//       body: Column(
//         children: [
//           const CustomAppBar(),
//           Expanded(child: child),
//         ],
//       ),
//     );
//   }

//   int _getCurrentIndex(BuildContext context) {
//     final location = GoRouterState.of(context).uri.toString();
//     if (location == '/dashboard') return 0;
//     if (location == '/orders') return 1;
//     if (location == '/create') return 2;
//     return 0;
//   }

//   void _navigateByIndex(BuildContext context, int index) {
//     switch (index) {
//       case 0:
//         context.go('/dashboard');
//         break;
//       case 1:
//         context.go('/orders');
//         break;
//       case 2:
//         context.go('/create');
//         break;
//     }
//   }
// }
