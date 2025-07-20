// ignore_for_file: avoid_print

import 'dart:io';

/// Script to generate TestLocalizationHelper with all localization keys
/// from AppLocalizations
void main() {
  try {
    // Read AppLocalizations file
    var path = Directory.current.path;
    // Use the current directory as the root path since we're already in the project root
    var rootPath = path;
    // throw Exception(rootPath);
    final appLocalizationsFile = File(
      '$rootPath/lib/core/generated/l10n/app_localizations.dart',
    );
    
    if (!appLocalizationsFile.existsSync()) {
      throw Exception('AppLocalizations file not found');
    }
    
    final content = appLocalizationsFile.readAsStringSync();
    
    // Extract all getter methods (localization keys)
    final getterPattern = RegExp(r'String get (\w+);');
    final matches = getterPattern.allMatches(content);
    
    final localizationKeys = matches.map((match) => match.group(1)!).toList();
    
    if (localizationKeys.isEmpty) {
      throw Exception('No localization keys found');
    }
    
    print('Found ${localizationKeys.length} localization keys');
    
    // Generate the switch cases
    final switchCases = localizationKeys.map((key) => 
      "      case '$key':\n        return _localizations!.$key;"
    ).join('\n');
    
    // Generate the complete TestLocalizationHelper file
    final helperContent = '''import 'package:flutter/material.dart';
import 'package:inmo_mobile/core/generated/l10n/app_localizations.dart';

/// Global locale holder for tests
/// 
/// This file is auto-generated. Do not edit manually.
/// Run `dart run scripts/language/test_localization_helper_gen.dart` to regenerate.
class TestLocalizationHelper {
  static Locale? _currentLocale;
  static AppLocalizations? _localizations;

  /// Set the current locale for tests
  static void setLocale(Locale locale) {
    _currentLocale = locale;
    _localizations = lookupAppLocalizations(locale);
  }

  /// Get the current locale
  static Locale? get currentLocale => _currentLocale;

  /// Get the current localizations instance
  static AppLocalizations? get localizations => _localizations;

  /// Get a localized string by key
  static String getLocalizedString(String key) {
    if (_localizations == null) {
      throw StateError('TestLocalizationHelper not initialized. Call setLocale() first.');
    }

    // Auto-generated switch statement from AppLocalizations
    switch (key) {
$switchCases
      default:
        // If key not found, return the key itself
        return key;
    }
  }

  /// Clear the locale (useful for test cleanup)
  static void clear() {
    _currentLocale = null;
    _localizations = null;
  }
}
''';
    
    // Write to the TestLocalizationHelper file
    final outputFile = File(
      '$rootPath/packages/inmo_test_helpers/lib/src/localization/test_localization_helper.dart',
    );
    
    outputFile.writeAsStringSync(helperContent);
    
    print('✅ TestLocalizationHelper generated successfully!');
    print('📍 Location: ${outputFile.path}');
    print('🔑 Total keys: ${localizationKeys.length}');
    
  } catch (e) {
    print('❌ Error generating TestLocalizationHelper: $e');
    exit(1);
  }
} 