import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:to_do_app/features/bottom_nav_bar/data/nav_bar_data.dart';

class MyPersistentBottomNavBar extends StatelessWidget {
  const MyPersistentBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: NavBarData().controller,
      screens: NavBarData().buildScreens(),
      items: NavBarData().navBarsItems(),
      navBarStyle: NavBarStyle.style15,
      navBarHeight: 96,
      padding: const EdgeInsets.only(bottom: 30, top: 10),
      backgroundColor: const Color(0xff363636),
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true,
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardAppears: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
    );
  }
}
