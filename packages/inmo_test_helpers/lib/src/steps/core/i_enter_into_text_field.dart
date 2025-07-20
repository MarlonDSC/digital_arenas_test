import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';

/// Usage: I enter {password} into {text} text field
Future<void> iEnterIntoTextField(PatrolTester $, String value, Key key) async {
  final textField = find.byKey(key);
  expect(textField, findsOneWidget,
      reason: 'TextField or TextFormField with key $key not found');
  await $(key).enterText(value);
}
