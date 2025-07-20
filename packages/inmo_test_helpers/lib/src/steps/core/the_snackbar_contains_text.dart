import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inmo_test_helpers/inmo_test_helpers.dart';
// import 'package:inmo_test_helpers/src/steps/steps.dart';
import 'package:patrol_finders/patrol_finders.dart';

/// Usage: The SnackBar contains {error} text
Future<void> theSnackbarContainsText(PatrolTester $, String message) async {
  // Wait for the SnackBar to appear
  await $.pumpAndSettle();
  
  // Find the ScaffoldMessenger
  final scaffoldMessenger = find.byType(ScaffoldMessenger);
  expect(scaffoldMessenger, findsOneWidget);

  // Find the SnackBar
  final snackBar = find.byType(SnackBar);
  expect(snackBar, findsOneWidget);

  // Get the SnackBar widget and verify its content
  final snackBarWidget = $.tester.widget<SnackBar>(snackBar);
  final textWidget = (snackBarWidget.content as Text).data;
  expect(
    textWidget,
    TestLocalizationHelper.getLocalizedString(message),
  );

  // Wait for half the display duration to ensure the message is visible
  // but don't wait for the full duration to keep tests fast
  await $.pump(const Duration(milliseconds: 500));
  
  // Verify the SnackBar is still visible
  expect(find.byType(SnackBar), findsOneWidget);
  
  // Optional: If you want to dismiss the SnackBar immediately to speed up tests
  final state = $.tester.state<ScaffoldMessengerState>(scaffoldMessenger);
  state.removeCurrentSnackBar();
  
  // Wait for the dismiss animation
  await $.pumpAndSettle();
}
