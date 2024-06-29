import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:home_care/features/home/home_screen.dart';
import 'package:home_care/features/navigation/navigation.dart';
import 'package:home_care/features/profile/profile_screen.dart';
import 'package:home_care/features/schedule/schedule_screen.dart';
import 'package:home_care/features/search/search_screen.dart';
import 'package:home_care/router/routers.dart';

final _rootNavigationKey = GlobalKey<NavigatorState>();
final _shellNavigationKey = GlobalKey<NavigatorState>();
final router = GoRouter(
  navigatorKey: _rootNavigationKey,
  initialLocation: Routes.homescreen.path,
  routes: [
    ShellRoute(
      parentNavigatorKey: _rootNavigationKey,
      navigatorKey: _shellNavigationKey,
      pageBuilder: (context, state, child) {
        int index = 0;

        if (state.fullPath == Routes.homescreen.path) {
          index = 0;
        } else if (state.fullPath == Routes.searchscreen.path) {
          index = 1;
        } else if (state.fullPath == Routes.schedulescreen.path) {
          index = 2;
        } else if (state.fullPath == Routes.profilescreen.path) {
          index = 3;
        }

        return CupertinoPage(
          child: Navigation(selectedIndex: index, child: child),
        );
      },
      routes: [
        GoRoute(
          parentNavigatorKey: _shellNavigationKey,
          name: Routes.homescreen.name,
          path: Routes.homescreen.path,
          pageBuilder: (context, state) {
            return const CupertinoPage(child: HomeScreen());
          },
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigationKey,
          name: Routes.searchscreen.name,
          path: Routes.searchscreen.path,
          pageBuilder: (context, state) {
            return const CupertinoPage(child: SearchScreen());
          },
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigationKey,
          name: Routes.profilescreen.name,
          path: Routes.profilescreen.path,
          pageBuilder: (context, state) {
            return const CupertinoPage(child: ProfileScreen());
          },
        ),
        GoRoute(
          parentNavigatorKey: _shellNavigationKey,
          name: Routes.schedulescreen.name,
          path: Routes.schedulescreen.path,
          pageBuilder: (context, state) {
            return const CupertinoPage(child: ScheduleScreen());
          },
        ),
      ],
    ),
  ],
);
