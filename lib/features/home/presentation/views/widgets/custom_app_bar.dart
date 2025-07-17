import 'package:flutter/material.dart';
import 'package:onyx_dashboard/core/extensions/context_extensions.dart';
import '../../../../../core/theme/app_colors.dart';
import 'saearch_box.dart';
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
    final isDark = context.isDarkMode;

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
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmall = constraints.maxWidth < 700;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (showMenuButton) MenuButton(onPressed: onMenuPressed),
                  const SizedBox(width: 8),
                  const Expanded(child: TitleSection()),
                  const Spacer(),
                  if (!isSmall) ...[
                    const Spacer(),
                    const Flexible(child: SearchBox()),
                  ],

                  const SizedBox(width: 12),
                  const NotificationButton(),
                  const SizedBox(width: 12),
                  const LanguageSwitcher(),
                  const SizedBox(width: 8),
                  const ThemeSwitcher(),
                  const SizedBox(width: 16),
                  const UserAvatar(),
                ],
              ),

              if (isSmall) ...[const SizedBox(height: 12), const SearchBox()],
            ],
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
