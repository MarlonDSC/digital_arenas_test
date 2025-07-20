import 'package:flutter/material.dart';
import 'package:inmo_mobile/core/generated/l10n/app_localizations.dart';

class BaseSheet extends StatelessWidget {
  final List<Widget> children;
  const BaseSheet({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...children,
          const Divider(),
          ListTile(
            title: Text(AppLocalizations.of(context)!.cancel),
            leading: const Icon(Icons.cancel),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
