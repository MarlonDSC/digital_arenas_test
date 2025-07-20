import 'package:adaptive_golden_test/adaptive_golden_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inmo_mobile/core/errors/bloc/rate_limit_mixin.dart';
import 'package:inmo_mobile/core/inmo.dart';
import 'package:inmo_mobile/core/router/config_router.dart';
import 'package:inmo_mobile/features/feature/presentation/ui/feature/feature_page.dart';
import 'package:inmo_test_helpers/inmo_test_helpers.dart';
import 'package:leak_tracker_flutter_testing/leak_tracker_flutter_testing.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    LeakTesting.settings = LeakTesting.settings.withIgnoredAll();
  });

  testAdaptiveWidgets('InitialState LoginPage', (tester, variant) async {
    SharedPreferences.setMockInitialValues({});
    await RateLimit.ensureInitialized();
    await setupDiHelper(RoutePath.feature);

    await tester.pumpWidget(
      AdaptiveWrapper(
        device: variant,
        orientation: Orientation.portrait,
        child: const Inmo(),
      ),
    );

    await tester.expectGolden<FeaturePage>(
      suffix: 'initial_state',
      version: 1,
      variant,
    );
  });
}