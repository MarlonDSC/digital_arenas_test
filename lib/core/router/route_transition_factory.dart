part of 'config_router.dart';

class RouterTransitionFactory {
  static CustomTransitionPage getTransitionPage(
      {required BuildContext context,
      required GoRouterState state,
      required Widget child,
      TransitionType? type}) {
    return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          type ??= Platform.isIOS ? TransitionType.slide : TransitionType.fade;
          switch (type) {
            case TransitionType.fade:
              return FadeTransition(opacity: animation, child: child);
            // case TransitionType.rotation:
            //   return RotationTransition(turns: animation, child: child);
            // case 'size':
            //   return SizeTransition(sizeFactor: animation, child: child);
            // case 'scale':
            //   return ScaleTransition(scale: animation, child: child);
            case TransitionType.slide: {
              var offset = Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.ease,
              ));
              return SlideTransition(position: offset, child: child);
            }
            default:
              return FadeTransition(opacity: animation, child: child);
          }
        });
  }
}
