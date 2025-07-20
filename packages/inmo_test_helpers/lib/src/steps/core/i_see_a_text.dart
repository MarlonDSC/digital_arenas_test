import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_finders/patrol_finders.dart';
import 'package:inmo_test_helpers/src/localization/test_localization_helper.dart';

/// Example: When I see {'text'} text
Future<void> iSeeAText(
  PatrolTester tester,
  String text,
) async {
  // Check if the text might be a localization key and get the localized version
  final localizedText = TestLocalizationHelper.getLocalizedString(text);
  
  expect(find.text(localizedText), findsOneWidget);
}