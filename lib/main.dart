import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inmo_mobile/core/errors/bloc/rate_limit_mixin.dart';
import 'package:inmo_mobile/core/inmo.dart';
import 'package:inmo_mobile/core/router/config_router.dart';
import 'package:inmo_mobile/di.dart';
import 'package:inmo_mobile/firebase_options.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';

void main() async {
  await initialize();

  const fatalError = true;
  // Non-async exceptions
  FlutterError.onError = (errorDetails) {
    if (fatalError) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      // ignore: dead_code
    } else {
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    if (fatalError) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      // ignore: dead_code
    } else {
      FirebaseCrashlytics.instance.recordError(error, stack);
    }
    return true;
  };

  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    await FirebasePerformance.instance.setPerformanceCollectionEnabled(false);
  }

  runApp(const Inmo());

  Bloc.observer = TalkerBlocObserver();
}

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RateLimit.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setupLocator('prod', RoutePath.start);
}
