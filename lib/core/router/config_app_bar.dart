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
    ///
    /// Logged out user
    ///
    RoutePath.feature: AppBarConfig(title: null, onPressed: null),
  };
}
