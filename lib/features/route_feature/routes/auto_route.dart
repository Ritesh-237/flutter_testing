import 'package:auto_route/auto_route.dart';
import 'package:dummy/features/route_feature/pages/home_page.dart';
import 'package:dummy/features/route_feature/pages/profile_page.dart';
import 'package:dummy/features/route_feature/pages/setting_page.dart';
import 'package:dummy/features/route_feature/routes/auto_route_guard.dart';
import 'package:flutter/material.dart';

import '../pages/bottom_navigation_page.dart';
import '../pages/login_page.dart';
import '../pages/songs_page.dart';

part 'auto_route.gr.dart';

@AutoRouterConfig()
class AutoRouter extends _$AutoRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: BottomNavigationRoute.page, initial: true, children: [
          AutoRoute(page: HomeRoute.page),
          AutoRoute(page: ProfileRoute.page),
          AutoRoute(page: SettingsRoute.page),
        ]),
        AutoRoute(page: SongsRoute.page, guards: [
          AuthGuard(),
        ]),
        AutoRoute(page: LoginRoute.page)
      ];
}
