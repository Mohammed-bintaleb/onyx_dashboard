import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onyx_dashboard/core/utils/app_styles.dart';
import 'package:onyx_dashboard/features/home/presentation/manger/theme_cubit/theme_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? Theme.of(context).scaffoldBackgroundColor
            : const Color(0xFFF5F8FA),
        border: Border(
          bottom: BorderSide(
            color: isDark ? Colors.white24 : Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Onyx',
                style: AppStyles.styleBold32(
                  context,
                ).copyWith(color: Colors.blue),
              ),
              if (!isMobile)
                Text(
                  'Dashboard',
                  style: AppStyles.styleBold32(
                    context,
                  ).copyWith(color: Colors.blue),
                ),
            ],
          ),
          const Spacer(),
          Container(
            width: 300,
            height: 40,
            decoration: BoxDecoration(
              color: isDark ? Theme.of(context).scaffoldBackgroundColor : null,
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
          const SizedBox(width: 12),
          IconButton(
            icon: const Icon(Icons.notifications_none, size: 24),
            onPressed: () {},
          ),
          const SizedBox(width: 12),

          IconButton(
            icon: const Icon(Icons.language, size: 24),
            onPressed: () {},
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 40,
            child: DropdownButton<ThemeMode>(
              underline: const SizedBox(),
              isDense: true,
              icon: const SizedBox.shrink(),
              value: Theme.of(context).brightness == Brightness.dark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              items: const [
                DropdownMenuItem(value: ThemeMode.light, child: Text("Light")),
                DropdownMenuItem(value: ThemeMode.dark, child: Text("Dark")),
              ],
              selectedItemBuilder: (context) => [
                const Icon(Icons.wb_sunny_outlined, size: 24),
                const Icon(Icons.nightlight_round, size: 24),
              ],
              onChanged: (mode) {
                if (mode != null) {
                  context.read<ThemeCubit>().toggleTheme(mode);
                }
              },
            ),
          ),
          const SizedBox(width: 16),

          CircleAvatar(
            radius: MediaQuery.of(context).size.width < 600 ? 16 : 20,
            backgroundImage: const NetworkImage(
              'https://i.pravatar.cc/150?img=47',
            ),
          ),
        ],
      ),
    );
  }
}
