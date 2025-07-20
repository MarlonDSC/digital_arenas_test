import 'package:flutter/material.dart';
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
      case 'salute':
        return _localizations!.salute;
      case 'dismiss':
        return _localizations!.dismiss;
      case 'createAccount':
        return _localizations!.createAccount;
      case 'firstName':
        return _localizations!.firstName;
      case 'lastName':
        return _localizations!.lastName;
      case 'countryCode':
        return _localizations!.countryCode;
      case 'phoneNumber':
        return _localizations!.phoneNumber;
      case 'email':
        return _localizations!.email;
      case 'password':
        return _localizations!.password;
      case 'countryDominicanRepublic':
        return _localizations!.countryDominicanRepublic;
      case 'countryUnitedStatesOfAmerica':
        return _localizations!.countryUnitedStatesOfAmerica;
      case 'countryGuatemala':
        return _localizations!.countryGuatemala;
      case 'signUpSuccess':
        return _localizations!.signUpSuccess;
      case 'takePhoto':
        return _localizations!.takePhoto;
      case 'chooseFromGallery':
        return _localizations!.chooseFromGallery;
      case 'chooseFromVideo':
        return _localizations!.chooseFromVideo;
      case 'takeVideo':
        return _localizations!.takeVideo;
      case 'deletePhoto':
        return _localizations!.deletePhoto;
      case 'replacePhoto':
        return _localizations!.replacePhoto;
      case 'cancel':
        return _localizations!.cancel;
      case 'signUp':
        return _localizations!.signUp;
      case 'calendar':
        return _localizations!.calendar;
      case 'camera':
        return _localizations!.camera;
      case 'contacts':
        return _localizations!.contacts;
      case 'location':
        return _localizations!.location;
      case 'locationAlways':
        return _localizations!.locationAlways;
      case 'locationWhenInUse':
        return _localizations!.locationWhenInUse;
      case 'mediaLibrary':
        return _localizations!.mediaLibrary;
      case 'microphone':
        return _localizations!.microphone;
      case 'phone':
        return _localizations!.phone;
      case 'photos':
        return _localizations!.photos;
      case 'photosAddOnly':
        return _localizations!.photosAddOnly;
      case 'reminders':
        return _localizations!.reminders;
      case 'sensors':
        return _localizations!.sensors;
      case 'sms':
        return _localizations!.sms;
      case 'speech':
        return _localizations!.speech;
      case 'storage':
        return _localizations!.storage;
      case 'ignoreBatteryOptimizations':
        return _localizations!.ignoreBatteryOptimizations;
      case 'notification':
        return _localizations!.notification;
      case 'accessMediaLocation':
        return _localizations!.accessMediaLocation;
      case 'activityRecognition':
        return _localizations!.activityRecognition;
      case 'emailVerification':
        return _localizations!.emailVerification;
      case 'enterVerificationCode':
        return _localizations!.enterVerificationCode;
      case 'weHaveSentAVerificationCodeToYourEmailAddress':
        return _localizations!.weHaveSentAVerificationCodeToYourEmailAddress;
      case 'verify':
        return _localizations!.verify;
      case 'resendCode':
        return _localizations!.resendCode;
      case 'verifyLater':
        return _localizations!.verifyLater;
      case 'emailVerificationSuccess':
        return _localizations!.emailVerificationSuccess;
      case 'logIn':
        return _localizations!.logIn;
      case 'forgotPassword':
        return _localizations!.forgotPassword;
      case 'acceptTermsAndConditions':
        return _localizations!.acceptTermsAndConditions;
      case 'acceptPrivacyPolicy':
        return _localizations!.acceptPrivacyPolicy;
      case 'errorEmailOrPasswordIncorrect':
        return _localizations!.errorEmailOrPasswordIncorrect;
      case 'english':
        return _localizations!.english;
      case 'spanish':
        return _localizations!.spanish;
      case 'french':
        return _localizations!.french;
      case 'language':
        return _localizations!.language;
      case 'search':
        return _localizations!.search;
      case 'saved_properties':
        return _localizations!.saved_properties;
      case 'profile':
        return _localizations!.profile;
      case 'dontHaveAnAccountSignUp':
        return _localizations!.dontHaveAnAccountSignUp;
      case 'alreadyHaveAnAccountSignIn':
        return _localizations!.alreadyHaveAnAccountSignIn;
      case 'unknown':
        return _localizations!.unknown;
      case 'errorUnknown':
        return _localizations!.errorUnknown;
      case 'errorCountryCodeEmpty':
        return _localizations!.errorCountryCodeEmpty;
      case 'errorCountryCodeInvalid':
        return _localizations!.errorCountryCodeInvalid;
      case 'errorUserNameEmpty':
        return _localizations!.errorUserNameEmpty;
      case 'errorUserNameTooLong':
        return _localizations!.errorUserNameTooLong;
      case 'errorUserNameInvalidCharacters':
        return _localizations!.errorUserNameInvalidCharacters;
      case 'errorUserNameTooShort':
        return _localizations!.errorUserNameTooShort;
      case 'errorNoInternetConnection':
        return _localizations!.errorNoInternetConnection;
      case 'errorEmailEmpty':
        return _localizations!.errorEmailEmpty;
      case 'errorEmailInvalid':
        return _localizations!.errorEmailInvalid;
      case 'errorEmailTooLong':
        return _localizations!.errorEmailTooLong;
      case 'errorEmailAlreadyExists':
        return _localizations!.errorEmailAlreadyExists;
      case 'errorLinkEmpty':
        return _localizations!.errorLinkEmpty;
      case 'errorLinkInvalid':
        return _localizations!.errorLinkInvalid;
      case 'errorPasswordEmpty':
        return _localizations!.errorPasswordEmpty;
      case 'errorPasswordTooShort':
        return _localizations!.errorPasswordTooShort;
      case 'errorPasswordNoUppercase':
        return _localizations!.errorPasswordNoUppercase;
      case 'errorPasswordNoLowercase':
        return _localizations!.errorPasswordNoLowercase;
      case 'errorPasswordNoNumber':
        return _localizations!.errorPasswordNoNumber;
      case 'errorPasswordNoSpecialCharacter':
        return _localizations!.errorPasswordNoSpecialCharacter;
      case 'errorPhoneNumberEmpty':
        return _localizations!.errorPhoneNumberEmpty;
      case 'errorPhoneNumberInvalid':
        return _localizations!.errorPhoneNumberInvalid;
      case 'errorTokenEmpty':
        return _localizations!.errorTokenEmpty;
      case 'errorTokenInvalid':
        return _localizations!.errorTokenInvalid;
      case 'errorEmailNotFound':
        return _localizations!.errorEmailNotFound;
      case 'errorTokenExpired':
        return _localizations!.errorTokenExpired;
      case 'errorTokenCodeNotFound':
        return _localizations!.errorTokenCodeNotFound;
      case 'errorEmailAlreadyVerified':
        return _localizations!.errorEmailAlreadyVerified;
      case 'errorConnectionFailed':
        return _localizations!.errorConnectionFailed;
      case 'errorBackendIsUnavailable':
        return _localizations!.errorBackendIsUnavailable;
      case 'errorTooManyRequests':
        return _localizations!.errorTooManyRequests;
      case 'errorEmailNotVerified':
        return _localizations!.errorEmailNotVerified;
      case 'errorInvalidCredentials':
        return _localizations!.errorInvalidCredentials;
      case 'errorGoogleAuthUnsupported':
        return _localizations!.errorGoogleAuthUnsupported;
      case 'errorGoogleAuthToken':
        return _localizations!.errorGoogleAuthToken;
      case 'errorGoogleLoginFailed':
        return _localizations!.errorGoogleLoginFailed;
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
