import 'package:flutter/material.dart';
import '../../models/drawer_item_model.dart';

class ActiveDrawerItem extends StatelessWidget {
  const ActiveDrawerItem({super.key, required this.drawerItemModel});

  final DrawerItemModel drawerItemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E2A3A),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(drawerItemModel.icon, color: Colors.white),
        title: Text(
          drawerItemModel.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
