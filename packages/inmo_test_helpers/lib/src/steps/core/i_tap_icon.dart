import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';

/// Example: When I tap {Icons.add} icon
Future<void> iTapIcon(PatrolTester $, IconData icon) async {
  await $.tap(find.byIcon(icon));
  await $.pump();
}
