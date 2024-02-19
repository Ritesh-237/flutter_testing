import 'package:dummy/features/route_feature/routes/auto_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final route = AutoRouter();
    return MaterialApp.router(
      routerConfig: route.config(),
    );
  }
}
