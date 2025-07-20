# Test Localization Helper

This helper allows you to use localized strings in your tests instead of hardcoded localization keys.

## How it works

1. **Automatic Initialization**: When the app starts in a test using `theAppIsRunningAt()`, the helper automatically detects the current locale and initializes itself.

2. **Automatic Translation in Steps**: When you use `iSeeAText()` with a localization key, it automatically translates it to the current locale.

## Usage

### In Feature Files

You can continue using localization keys in your feature files:

```gherkin
Then I see a {'emailVerificationSuccess'} text
```

### In Test Files

The `i_see_a_text` step will automatically translate the key:

```dart
await iSeeAText($, 'emailVerificationSuccess');
// This will look for "Verificación de correo electrónico exitosa" if locale is Spanish
```

### Direct Usage

You can also use the helper directly in your tests:

```dart
// Get the current locale
final locale = TestLocalizationHelper.currentLocale;

// Get a localized string
final text = TestLocalizationHelper.getLocalizedString('emailVerificationSuccess');

// Get the localizations instance
final localizations = TestLocalizationHelper.localizations;
```

## Example

```dart
patrolWidgetTest('Verify email success message', ($) async {
  // The app is initialized with Spanish locale
  await theAppIsRunningAt($, RoutePath.emailVerification);
  
  // Enter verification code
  await iEnterACode($, '123456');
  
  // Tap verify button
  await iTapButton($, pageKeys.emailVerificationPage.verifyButton);
  
  // This will look for "Verificación de correo electrónico exitosa"
  await iSeeAText($, 'emailVerificationSuccess');
});
```

## Supported Keys

All keys from `AppLocalizations` are supported. If a key is not found, the helper returns the key itself as a fallback.

## Adding New Keys

The `TestLocalizationHelper` is auto-generated. When new localization keys are added to `AppLocalizations`, run the following command to regenerate the helper:

```bash
dart run scripts/language/test_localization_helper_gen.dart
```

This will automatically extract all localization keys from `AppLocalizations` and update the `TestLocalizationHelper` with the new keys.

⚠️ **Note**: Do not manually edit `test_localization_helper.dart` as it is auto-generated and your changes will be overwritten. 