import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:inmo_mobile/core/errors/bloc/message/message_bloc.dart';
import 'package:inmo_mobile/core/errors/bloc/modal/modal_bloc.dart';
import 'package:inmo_mobile/core/generated/l10n/app_localizations.dart';
import 'package:inmo_mobile/core/value_objects/priority_type.dart';
import 'package:inmo_mobile/core/router/config_router.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final AppBarConfig appBarConfig;
  final bool showBottomNavigationBar;
  final StatefulNavigationShell? navigationShell;
  const MainLayout({
    super.key,
    required this.child,
    required this.appBarConfig,
    this.navigationShell,
    required this.showBottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBarConfig.title != null
              ? AppBar(
                title: Text(appBarConfig.title!),
                leading: _buildLeadingButton(),
              )
              : null,
      body: MultiBlocListener(
        listeners: [
          BlocListener<MessageBloc, MessageState>(listener: _messageListener),
          BlocListener<ModalBloc, ModalState>(listener: _modalListener),
        ],
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 16),
          maintainBottomViewPadding: true,
          child: child,
        ),
      ),
      bottomNavigationBar:
          showBottomNavigationBar
              ? NavigationBar(
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected,
                selectedIndex: navigationShell!.currentIndex,
                destinations: [
                  NavigationDestination(
                    label: AppLocalizations.of(context)!.search,
                    icon: const Icon(Icons.search),
                  ),
                  NavigationDestination(
                    label: AppLocalizations.of(context)!.saved_properties,
                    icon: const Icon(Icons.favorite),
                  ),
                  NavigationDestination(
                    label: AppLocalizations.of(context)!.profile,
                    icon: const Icon(Icons.person),
                  ),
                ],
                onDestinationSelected: _goBranch,
              )
              : null,
    );
  }

  void _goBranch(int branchIndex) => navigationShell!.goBranch(
    branchIndex,
    initialLocation: branchIndex == navigationShell!.currentIndex,
  );

  void _messageListener(BuildContext context, MessageState state) async {
    if (state is DisplayedMessageState) {
      if (state.priority == PriorityType.low) {
        for (var e in state.messageChunks) {
          var displayWidth = MediaQuery.of(context).size.width;
          var rightMargin = 10.0;
          var leftMargin =
              displayWidth >= 910 ? (displayWidth - 500).toDouble() : 10.0;
          var bottomMargin =
              displayWidth >= 910
                  ? MediaQuery.of(context).size.height - 150
                  : 8.0;

          SnackBar snackBar = SnackBar(
            content: Text(e.join('\n')),
            backgroundColor: state.color,
            dismissDirection: DismissDirection.startToEnd,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(
              bottom: bottomMargin,
              left: leftMargin,
              right: rightMargin,
            ),
            showCloseIcon: true,
            action:
                state.action != null
                    ? SnackBarAction(
                      label: state.action!.key,
                      onPressed: state.action!.value,
                    )
                    : null,
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } else if (state.priority == PriorityType.medium) {
        ScaffoldMessenger.of(context).showMaterialBanner(
          MaterialBanner(
            content: Text(state.messages.join('\n')),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                },
                child: Text(
                  AppLocalizations.of(context)!.dismiss.toUpperCase(),
                ),
              ),
            ],
          ),
        );
      } else if (state.priority == PriorityType.high) {
        await showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text('Error'),
                content: Text(state.messages.join('\n')),
              ),
        );
      }
    }
  }

  void _modalListener(BuildContext context, ModalState state) async {
    if (state is DisplayModalState) {
      await showModalBottomSheet(
        context: context,
        // constraints: const BoxConstraints(maxHeight: 700),
        builder: (context) => state.modal,
      );
    }
  }

  Widget? _buildLeadingButton() {
    return appBarConfig.onPressed != null
        ? IconButton(
          onPressed: appBarConfig.onPressed,
          icon: Icon(Icons.adaptive.arrow_back),
        )
        : null;
  }
}
