import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.of(context).size.width < 600 ? 16 : 25,
      backgroundImage: const NetworkImage('https://picsum.photos/400'),
    );
  }
}
