import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:user/features/home/presentation/screens/home_screen.dart';
import '../../utils/app_colors.dart';
import '../../../features/favorite/presentation/screens/favorite_screen.dart';
import '../../../features/profile/presentation/screens/profile_screen.dart';
import '../../../features/search/presentation/screens/search_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static final List<Map<String, dynamic>> _screens = [
    {"icon": Icons.home},
    {"icon": Icons.search_sharp},
    {"icon": Icons.favorite},
    {"icon": Icons.person},
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: const [
        HomeScreen(),
        SearchScreen(),
        FavoriteScreen(),
        ProfileScreen(),
      ],
      items: _screens
          .map((e) => PersistentBottomNavBarItem(
                icon: Icon(e["icon"]),
                activeColorPrimary: AppColors.blueLight,
                inactiveColorPrimary: AppColors.grey,
              ))
          .toList(),
      confineInSafeArea: true,
      backgroundColor: AppColors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: const NavBarDecoration(
          colorBehindNavBar: Color.fromRGBO(83, 83, 83, 0.6),
          borderRadius: BorderRadius.zero),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: false,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style12, // Choose the nav bar style with this property.
    );
  }
}
