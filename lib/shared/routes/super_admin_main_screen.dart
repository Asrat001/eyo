import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';

/// Super Admin Main Screen with bottom navigation
class SuperAdminMainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const SuperAdminMainScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(canPop: false, child: navigationShell),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        items: [
          BottomNavigationBarItem(
            label: 'Dashboard',
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
              color: Colors.grey.shade400,
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/home.svg",
              color: AppColors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Manage Admins',
            icon: Icon(Icons.admin_panel_settings, color: Colors.grey.shade400),
            activeIcon: Icon(
              Icons.admin_panel_settings,
              color: AppColors.white,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: SvgPicture.asset(
              "assets/icons/user.svg",
              color: Colors.grey.shade400,
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/user.svg",
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
