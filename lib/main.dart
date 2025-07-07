import 'package:flutter/material.dart';
import 'package:onyx_dashboard/views/dash_board_view.dart';

void main() {
  runApp(const OnyxDashbord());
}

class OnyxDashbord extends StatelessWidget {
  const OnyxDashbord({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DashBoardView(),
    );
  }
}
