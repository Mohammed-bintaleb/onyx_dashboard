import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import 'aearch_box.dart';
import 'language_button.dart';
import 'menu_button.dart';
import 'notification_button.dart';
import 'theme_switcher.dart';
import 'title_section.dart';
import 'user_avatar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showMenuButton;
  final VoidCallback? onMenuPressed;

  const CustomAppBar({
    super.key,
    this.showMenuButton = false,
    this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
        border: Border(
          bottom: BorderSide(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (showMenuButton) MenuButton(onPressed: onMenuPressed),
          const SizedBox(width: 8),
          const Expanded(child: TitleSection()),
          const Spacer(),
          const Flexible(child: SearchBox()), // ما يحتاج isDarkMode بعد الآن
          NotificationButton(),
          const SizedBox(width: 12),
          LanguageSwitcher(),
          const SizedBox(width: 12),
          ThemeSwitcher(),
          const SizedBox(width: 16),
          UserAvatar(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);
}
