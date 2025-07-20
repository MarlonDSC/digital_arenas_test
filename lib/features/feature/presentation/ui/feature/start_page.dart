import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inmo_mobile/core/router/config_router.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.pets),
          title: const Text('Ver razas'),
          onTap: () => context.push(RoutePath.breeds),
        ),
        ListTile(
          leading: const Icon(Icons.favorite),
          title: const Text('Ver mis favoritos'),
          onTap: () => context.push(RoutePath.favourites),
        ),
      ],
    );
  }
}