import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:inmo_mobile/core/constants/app_theme.dart';
import 'package:inmo_mobile/core/errors/bloc/message/message_bloc.dart';
import 'package:inmo_mobile/core/errors/bloc/modal/modal_bloc.dart';
import 'package:inmo_mobile/di.dart';
import 'package:inmo_mobile/l10n/l10n.dart';
import 'package:inmo_mobile/core/generated/l10n/app_localizations.dart';
import 'package:inmo_mobile/core/router/config_router.dart';

class Inmo extends StatefulWidget {
  const Inmo({super.key});

  @override
  State<Inmo> createState() => _InmoState();
}

class _InmoState extends State<Inmo> {
  final _router = sl<ConfigRouter>().router;


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<MessageBloc>()),
        BlocProvider(create: (context) => sl<ModalBloc>()),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: const Locale('es'),
        supportedLocales: L10n.all,
        title: 'Inmo',
        theme: AppTheme.themeData,
      ),
    );
  }
}
