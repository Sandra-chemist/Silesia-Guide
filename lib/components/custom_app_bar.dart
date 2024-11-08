import 'package:flutter/material.dart';
import 'package:silesia_guide/utils/colors.dart';
import 'package:silesia_guide/utils/spacing.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: MediaQuery.of(context).size.width < 600 ? 80 : 100,
      leading: _buildIconButton(Icons.menu, () {}),
      actions: [
        _buildIconButton(Icons.favorite_border, () {}),
        const SizedBox(width: gap16),
        _buildIconButton(Icons.search, () {}),
      ],
    );
  }

  Widget _buildIconButton(IconData iconData, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(iconData, color: AppColors.blueColor, size: 34),
      onPressed: onPressed,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
