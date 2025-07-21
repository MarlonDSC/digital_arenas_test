import 'package:adaptive_golden_test/adaptive_golden_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inmo_mobile/core/inmo.dart';
import 'package:inmo_mobile/core/router/config_router.dart';
import 'package:inmo_mobile/features/start/presentation/ui/feature/start_page.dart';
import 'package:inmo_test_helpers/inmo_test_helpers.dart';
import 'package:leak_tracker_flutter_testing/leak_tracker_flutter_testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  const MethodChannel appLinksChannel = MethodChannel(
    'com.llfbandit.app_links/events',
  );

  setUp(() async {
    LeakTesting.settings = LeakTesting.settings.withIgnoredAll();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(appLinksChannel, (
          MethodCall methodCall,
        ) async {
          // You can customize the response if needed
          return null;
        });

    SharedPreferences.setMockInitialValues({});
    await setupDiHelper(RoutePath.start);
  });

  testAdaptiveWidgets('InitialState StartPage', (tester, variant) async {
    await tester.pumpWidget(
      AdaptiveWrapper(
        device: variant,
        orientation: Orientation.portrait,
        child: const Inmo(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.expectGolden<StartPage>(
      suffix: 'initial_state',
      version: 1,
      variant,
    );
  });
}