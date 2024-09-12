import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:to_do_app/core/utiles/colors.dart';
import 'package:to_do_app/features/add_todo/presentation/views/todo_view.dart';
import 'package:to_do_app/features/bottom_nav_bar/data/navbar_icons.dart';
import 'package:to_do_app/features/calendar/presentation/views/calendar_view.dart';
import 'package:to_do_app/features/focus/presentation/views/focus_view.dart';
import 'package:to_do_app/features/home/presentation/views/home_view.dart';
import 'package:to_do_app/features/profile/presentation/views/profile_view.dart';

class NavBarData {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  final Map<String, WidgetBuilder> _routes = {
    "/first": (final context) => const CalendarView(),
    "/second": (final context) => const ProfileView(),
  };

  Map<Widget, PersistentBottomNavBarItem> _navBarData() => {
        const HomeView(): PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            NavIcons.homeActive,
            height: 24,
          ),
          inactiveIcon: SvgPicture.asset(NavIcons.homeInActive, height: 24),
          title: ("Index"),
          activeColorPrimary: Colors.white,
          routeAndNavigatorSettings:
              RouteAndNavigatorSettings(initialRoute: "/", routes: _routes),
        ),
        const CalendarView(): PersistentBottomNavBarItem(
          icon: SvgPicture.asset(NavIcons.calendarActive),
          inactiveIcon: SvgPicture.asset(
            NavIcons.calendarInActive,
          ),
          title: ("Calendar"),
          activeColorPrimary: Colors.white,
          routeAndNavigatorSettings:
              RouteAndNavigatorSettings(initialRoute: "/", routes: _routes),
        ),
        const AddTodoView(): PersistentBottomNavBarItem(
          icon: SvgPicture.asset(NavIcons.add),
          activeColorPrimary: AppColors.kPrimaryColor,
          routeAndNavigatorSettings:
              RouteAndNavigatorSettings(initialRoute: "/", routes: _routes),
        ),
        const FocusView(): PersistentBottomNavBarItem(
          icon: SvgPicture.asset(NavIcons.clockActive),
          inactiveIcon: SvgPicture.asset(NavIcons.clockInActive),
          title: ("Focus"),
          activeColorPrimary: Colors.white,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              "/first": (final context) => const CalendarView(),
              "/second": (final context) => const ProfileView(),
            },
          ),
        ),
        const ProfileView(): PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          inactiveIcon: SvgPicture.asset(NavIcons.profile),
          title: ("Profile"),
          activeColorPrimary: Colors.white,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              "/first": (final context) => const CalendarView(),
              "/second": (final context) => const ProfileView(),
            },
          ),
        ),
      };

  List<Widget> buildScreens() => _navBarData().keys.toList();

  List<PersistentBottomNavBarItem> navBarsItems() =>
      _navBarData().values.toList();
}
