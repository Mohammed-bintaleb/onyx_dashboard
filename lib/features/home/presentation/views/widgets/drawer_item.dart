// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../../../data/models/drawer_item_model.dart';

class DrawerItem extends StatelessWidget {
  final DrawerItemModel drawerItemModel;
  final bool isActive;
  final VoidCallback onTap;

  const DrawerItem({
    super.key,
    required this.drawerItemModel,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? Colors.white.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: isRTL
            ? null
            : Icon(
                drawerItemModel.icon,
                color: isActive ? Colors.white : Colors.grey[400],
              ),
        trailing: isRTL
            ? Icon(
                drawerItemModel.icon,
                color: isActive ? Colors.white : Colors.grey[400],
              )
            : null,
        title: FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: Text(
            drawerItemModel.title,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.grey[400],
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
