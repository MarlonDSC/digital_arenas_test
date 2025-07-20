import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I'm on the {'text'} page
Future<void> imOnThePage(WidgetTester $, String param1) async {
  expect(find.byKey(Key(param1)), findsOneWidget);
}
