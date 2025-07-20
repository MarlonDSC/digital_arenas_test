import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';

/// Usage: I see {LoginPage} page
Future<void> iSeePage(PatrolTester $, Type widget) async {
  expect(find.byType(widget), findsOneWidget);
}
