import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:leak_tracker_flutter_testing/leak_tracker_flutter_testing.dart';
import 'package:adaptive_golden_test/adaptive_golden_test.dart';

final defaultDeviceConfigs = {
  Devices.ios.iPhoneSE,
  Devices.ios.iPhone12,
  Devices.ios.iPad,
  Devices.android.pixel4,
  Devices.android.samsungGalaxyS20,
};

const _kGoldenTestsThreshold = 5 / 100; // 5% tolerance

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  LeakTesting.enable();

  /// Issue regarding GC in Flutter
  /// https://github.com/flutter/flutter/issues/126995
  LeakTesting.settings = LeakTesting.settings.withIgnored(
    createdByTestHelpers: true,
    notDisposed: {
      'GoRouteInformationProvider': 1,
      'GoRouterDelegate': 2,
      'GoRouter': 3,
      'GoRouterState': 4,
      'GoRouterStateScope': 5,
      'GoRouterStateScopeFn': 6,
      'GoRouterStateScopeWithFunction': 7,
      'GoRouterStateScopeWithFunctionAndContext': 8,
    },
  );

  TestWidgetsFlutterBinding.ensureInitialized();
  AdaptiveTestConfiguration.instance.setDeviceVariants(defaultDeviceConfigs);
  await loadFonts();
  setupFileComparatorWithThreshold(_kGoldenTestsThreshold);
  await testMain();
}
