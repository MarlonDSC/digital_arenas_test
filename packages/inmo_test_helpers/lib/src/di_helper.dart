import 'dart:async';

import 'package:inmo_mobile/di.dart';
import 'test_helper.mocks.dart';

Future<void> setupDiHelper(String initialRoute) async {
  await sl.reset();
  setupLocator('test', initialRoute);
  // sl.registerLazySingleton<RequestPermissionUseCase>(() => MockRequestPermissionUseCase());
}
