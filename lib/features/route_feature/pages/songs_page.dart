import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SongsPage extends StatelessWidget {
  const SongsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Songs')),
    );
  }
}
