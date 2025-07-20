// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

import 'package:patrol_finders/patrol_finders.dart';
import 'package:inmo_mobile/core/value_objects/country.dart';
import 'package:inmo_mobile/core/constants/page_keys.dart';
import 'package:inmo_mobile/core/router/config_router.dart';
import 'package:inmo_mobile/features/feature/presentation/ui/feature/feature_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './hook/hooks.dart';
import 'package:inmo_test_helpers/src/steps/core/the_app_is_running_at.dart';
import 'package:inmo_test_helpers/src/steps/core/i_see_exactly_widgets.dart';

void main() {
  setUpAll(() async {
    await Hooks.beforeAll();
  });
  tearDownAll(() async {
    await Hooks.afterAll();
  });

  group('''Feature Page''', () {
    Future<void> bddSetUp(PatrolTester $) async {
      await theAppIsRunningAt($, RoutePath.feature);
      await iSeeExactlyWidgets($, 1, FeaturePage);
    }

    Future<void> beforeEach(String title, [List<String>? tags]) async {
      await Hooks.beforeEach(title, tags);
    }

    Future<void> afterEach(String title, bool success,
        [List<String>? tags]) async {
      await Hooks.afterEach(title, success, tags);
    }

    patrolWidgetTest('''The feature page is displayed''', ($) async {
      var success = true;
      try {
        await beforeEach('''The feature page is displayed''');
        await bddSetUp($);
        await iSeeExactlyWidgets($, 1, FeaturePage);
      } on TestFailure {
        success = false;
        rethrow;
      } finally {
        await afterEach(
          '''The feature page is displayed''',
          success,
        );
      }
    });
  });
}
