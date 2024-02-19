import 'package:auto_route/auto_route.dart';
import 'package:dummy/features/route_feature/routes/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BottomNavigationPage extends StatelessWidget {
  const BottomNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [ProfileRoute(), HomeRoute(), SettingsRoute()],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (int currentIndex) {
              tabsRouter.setActiveIndex(currentIndex);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded), label: 'Profile'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings')
            ],
          ),
        );
      },
    );
  }
}
