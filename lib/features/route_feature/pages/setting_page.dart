import 'package:auto_route/auto_route.dart';
import 'package:dummy/features/route_feature/routes/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          TextButton(
              onPressed: () {
                context.router.push(const SongsRoute());
              },
              child: const Text('Navigate To Songs')),
          TextButton(
              onPressed: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.clear();
              },
              child: const Text('Logout')),
        ],
      ),
    );
  }
}
