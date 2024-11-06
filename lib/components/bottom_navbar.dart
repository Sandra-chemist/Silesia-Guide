import 'package:flutter/material.dart';
import 'package:silesia_guide/ui/colors.dart';

typedef NavItems = List<({IconData icon, String label})>;

class BottomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  BottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final NavItems _navItems = [
    (icon: Icons.home_outlined, label: 'Śląskie.'),
    (icon: Icons.newspaper_outlined, label: 'Aktualności'),
    (icon: Icons.calendar_month_outlined, label: 'Wydarzenia'),
    (icon: Icons.map_outlined, label: 'Eksploruj'),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth < 600 ? 26 : 28;
    double unselectedFontSize = screenWidth < 600 ? 12 : 14;
    double selectedFontSize = screenWidth < 600 ? 14 : 16;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: AppColors.backgroundNavbarColor,
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: AppColors.selectedItemColor,
        unselectedItemColor: AppColors.unselectedItemColor,
        backgroundColor: AppColors.backgroundNavbarColor,
        elevation: 0,
        iconSize: iconSize,
        unselectedFontSize: unselectedFontSize,
        selectedFontSize: selectedFontSize,
        items: _navItems.map<BottomNavigationBarItem>((item) {
          return BottomNavigationBarItem(
            icon: Icon(item.icon),
            label: item.label,
          );
        }).toList(),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
