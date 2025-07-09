import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onyx_dashboard/views/manger/theme_cubit/theme_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? Theme.of(context).scaffoldBackgroundColor
            : const Color(0xFFF5F8FA),
        border: Border(
          bottom: isDark
              ? BorderSide(color: Colors.white24, width: 1)
              : BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),

      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // شعار Onyx Dashboard
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Onyx',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Spacer(),

          // حقل البحث
          Container(
            width: 220,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Theme.of(context).scaffoldBackgroundColor
                  : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: const [
                Icon(Icons.search, color: Colors.grey, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      isCollapsed: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: InputBorder.none,
                      hintText: 'Search...',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),

          IconButton(
            icon: const Icon(Icons.notifications_none, size: 24),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.language, size: 24),
            onPressed: () {},
          ),
          DropdownButton(
            underline: const SizedBox(),
            icon: Icon(Icons.wb_sunny_outlined, size: 24),
            value: Theme.of(context).brightness == Brightness.dark
                ? ThemeMode.dark
                : ThemeMode.light,
            items: [
              DropdownMenuItem(
                value: ThemeMode.light,
                child: Text("Light Mode"),
              ),
              DropdownMenuItem(value: ThemeMode.dark, child: Text("Dark Mode")),
            ],
            onChanged: (mode) {
              if (mode != null) {
                context.read<ThemeCubit>().toggleTheme(mode);
              }
            },
          ),
          const SizedBox(width: 16),

          // صورة البروفايل
          const CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=47'),
          ),
        ],
      ),
    );
  }
}
