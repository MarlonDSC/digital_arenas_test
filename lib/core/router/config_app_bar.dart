part of 'config_router.dart';

class AppBarConfig {
  final String? title;
  final Function()? onPressed;

  AppBarConfig({required this.title, this.onPressed});
}

AppBarConfig appBarConfig(GoRouterState state, BuildContext context) {
  return stringToAppBarConfig(state.fullPath!, context)[state.fullPath!]!;
}

Map<String, AppBarConfig> stringToAppBarConfig(
  String path,
  BuildContext context,
) {
  return {
    RoutePath.start: AppBarConfig(title: 'GustoMaster', onPressed: null),
    RoutePath.breeds: AppBarConfig(title: 'Razas', onPressed: () => context.pop()),
    RoutePath.breedInfo: AppBarConfig(title: 'Información de la raza', onPressed: () => context.pop()),
    RoutePath.favourites: AppBarConfig(title: 'Favoritos', onPressed: () => context.pop()),
    RoutePath.favouriteInfo: AppBarConfig(title: 'Información del favorito', onPressed: () => context.pop()),
  };
}
