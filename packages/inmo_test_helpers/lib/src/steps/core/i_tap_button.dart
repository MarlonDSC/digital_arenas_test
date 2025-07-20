import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';

/// Usage: I tap {'text'} button
Future<void> iTapButton(PatrolTester $, Key key) async {
  // Finds a parent widget of type MyParentWidget.
  // var parent = $.tester
  //     .element(find.byKey(key))
  //     .findAncestorWidgetOfExactType();
  // if (parent != null) {
  await $.scrollUntilVisible(finder: find.byKey(key));
  // }
  await $.tap(find.byKey(key));
  await $.pump();
}
