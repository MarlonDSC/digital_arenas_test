import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inmo_test_helpers/inmo_test_helpers.dart';
import 'package:patrol_finders/patrol_finders.dart';
import 'package:inmo_mobile/core/inmo.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Usage: The app is initialized
Future<void> theAppIsRunningAt(PatrolTester $, String initialRoute) async {
  // TestWidgetsFlutterBinding.ensureInitialized();
  // ignore: invalid_use_of_visible_for_testing_member
  SharedPreferences.setMockInitialValues({});
  await setupDiHelper(initialRoute);
  await $.pumpWidget(const Inmo());
  final materialApp = $.tester.widget<MaterialApp>(find.byType(MaterialApp));

  expect(materialApp.locale, const Locale('es'));

  log('materialApp.locale: ${materialApp.locale}');

  // Initialize the TestLocalizationHelper with the current locale
  TestLocalizationHelper.setLocale(materialApp.locale ?? const Locale('es'));

  await $.pumpAndSettle();
}
