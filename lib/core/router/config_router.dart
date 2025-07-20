import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:inmo_mobile/core/ui/layout/main_layout.dart';
import 'package:inmo_mobile/core/value_objects/transition_type.dart';
import 'package:inmo_mobile/di.dart';
import 'package:inmo_mobile/features/breeds/presentation/cubit/breed_image/breed_image_cubit.dart';
import 'package:inmo_mobile/features/breeds/presentation/cubit/breed_info/breed_info_cubit.dart';
import 'package:inmo_mobile/features/breeds/presentation/cubit/breeds/breeds_cubit.dart';
import 'package:inmo_mobile/features/breeds/presentation/ui/breed_info/breed_info_page.dart';
import 'package:inmo_mobile/features/breeds/presentation/ui/breeds/breeds_page.dart';
import 'package:inmo_mobile/features/favourite/presentation/cubit/favourite_info/favourite_info_cubit.dart';
import 'package:inmo_mobile/features/favourite/presentation/cubit/favourites/favourites_cubit.dart';
import 'package:inmo_mobile/features/favourite/presentation/ui/favourite_info/favourite_info_page.dart';
import 'package:inmo_mobile/features/favourite/presentation/ui/favourites/favourites_page.dart';
import 'package:inmo_mobile/features/start/presentation/ui/feature/start_page.dart';

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
            path: RoutePath.start,
            pageBuilder: (context, state) =>
                RouterTransitionFactory.getTransitionPage(
                  context: context,
                  state: state,
                  child: const StartPage(),
                ),
            routes: [
              GoRoute(
                path: RoutePath.breeds,
                pageBuilder: (context, state) =>
                    RouterTransitionFactory.getTransitionPage(
                      context: context,
                      state: state,
                      child: BlocProvider(
                        create: (context) => sl<BreedsCubit>()..getBreeds(),
                        child: const BreedsPage(),
                      ),
                    ),
                routes: [
                  GoRoute(
                    path: ':id',
                    pageBuilder: (context, state) =>
                        RouterTransitionFactory.getTransitionPage(
                          context: context,
                          state: state,
                          child: MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (context) => sl<BreedInfoCubit>()
                                  ..getBreedInfo(
                                    int.parse(state.pathParameters['id']!),
                                  ),
                              ),
                              BlocProvider(
                                create: (context) => sl<BreedImageCubit>(),
                              ),
                            ],
                            child: BreedInfoPage(
                              id: int.parse(state.pathParameters['id']!),
                            ),
                          ),
                        ),
                  ),
                ],
              ),
              GoRoute(
                path: RoutePath.favourites,
                pageBuilder: (context, state) =>
                    RouterTransitionFactory.getTransitionPage(
                      context: context,
                      state: state,
                      child: BlocProvider(
                        create: (context) =>
                            sl<FavouritesCubit>()..getAllFavourites(),
                        child: const FavouritesPage(),
                      ),
                    ),
                routes: [
                  GoRoute(
                    path: ':id',
                    pageBuilder: (context, state) =>
                        RouterTransitionFactory.getTransitionPage(
                          context: context,
                          state: state,
                          child: MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (context) => sl<FavouriteInfoCubit>()
                                  ..getFavourite(
                                    int.parse(state.pathParameters['id']!),
                                  ),
                              ),
                              BlocProvider(
                                create: (context) => sl<FavouritesCubit>(),
                              ),
                            ],
                            child: const FavouriteInfoPage(),
                          ),
                        ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
