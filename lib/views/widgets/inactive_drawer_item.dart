import 'package:flutter/material.dart';
import '../../models/drawer_item_model.dart';

class InActiveDrawerItem extends StatelessWidget {
  const InActiveDrawerItem({super.key, required this.drawerItemModel});

  final DrawerItemModel drawerItemModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(drawerItemModel.icon, color: Colors.white),
      title: FittedBox(
        alignment: Alignment.centerLeft,
        fit: BoxFit.scaleDown,
        child: Text(
          drawerItemModel.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
