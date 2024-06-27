import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:home_care/features/home/home_screen.dart';
import 'package:home_care/router/routers.dart';

final router = GoRouter(routes: [
  GoRoute(
    name: Routes.home.name,
    path: Routes.home.path,
    pageBuilder: (context, state) {
      return const CupertinoPage(child: HomeScreen());
    },
  )
]);
