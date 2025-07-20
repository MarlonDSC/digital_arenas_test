import 'package:patrol_finders/patrol_finders.dart';
import 'package:inmo_mobile/core/value_objects/country.dart';
import 'package:inmo_mobile/core/constants/page_keys.dart';
import 'package:inmo_mobile/core/router/config_router.dart';
import 'package:inmo_mobile/features/feature/presentation/ui/feature/feature_page.dart';


Feature: Feature Page

Background:
    Given the app is running at {RoutePath.feature}
    And I see exactly {1} {FeaturePage} widgets

Scenario: The feature page is displayed
    Given I see exactly {1} {FeaturePage} widgets