import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';

/// Example: Then I see {Icons.add} icon
Future<void> iSeeIcon(
  PatrolTester tester,
  IconData icon,
) async {
  expect(find.byIcon(icon), findsOneWidget);
}
