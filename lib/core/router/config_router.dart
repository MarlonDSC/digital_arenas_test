import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:inmo_mobile/core/ui/layout/main_layout.dart';
import 'package:inmo_mobile/core/value_objects/transition_type.dart';
import 'package:inmo_mobile/features/feature/presentation/ui/feature/feature_page.dart';

part 'route_path.dart';
part 'route_transition_factory.dart';
part 'config_app_bar.dart';

class ConfigRouter {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  final String initialLocation;

  ConfigRouter({required this.initialLocation});

  late final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: initialLocation,
    routes: [
      ShellRoute(
        builder: (context, GoRouterState state, child) => MainLayout(
          appBarConfig: appBarConfig(state, context),
          showBottomNavigationBar: false,
          child: child,
        ),
        routes: [
          GoRoute(
            path: RoutePath.feature,
            pageBuilder: (context, state) =>
                RouterTransitionFactory.getTransitionPage(
                  context: context,
                  state: state,
                  child: const FeaturePage(),
                ),
          ),
        ],
      ),
    ],
  );
}
