import 'package:flutter/material.dart';
import 'package:inmo_mobile/core/errors/base_error.dart';
import 'package:inmo_mobile/core/generated/l10n/app_localizations.dart';

extension AppLocalizationExtension on AppLocalizations {
  String error(BaseError error, BuildContext context) {
    return switch (error.code) {
      'errorNoInternetConnection' => AppLocalizations.of(context)!.errorNoInternetConnection,
      'errorBackendIsUnavailable' => AppLocalizations.of(context)!.errorBackendIsUnavailable,
      'errorConnectionFailed' => AppLocalizations.of(context)!.errorConnectionFailed,
      'errorTooManyRequests' => AppLocalizations.of(context)!.errorTooManyRequests,
      'errorCountryCodeEmpty' => AppLocalizations.of(context)!.errorCountryCodeEmpty,
      'errorCountryCodeInvalid' => AppLocalizations.of(context)!.errorCountryCodeInvalid,
      'errorEmailEmpty' => AppLocalizations.of(context)!.errorEmailEmpty,
      'errorEmailInvalid' => AppLocalizations.of(context)!.errorEmailInvalid,
      'errorEmailTooLong' => AppLocalizations.of(context)!.errorEmailTooLong,
      'errorEmailAlreadyExists' => AppLocalizations.of(context)!.errorEmailAlreadyExists,
      'errorEmailNotFound' => AppLocalizations.of(context)!.errorEmailNotFound,
      'errorEmailAlreadyVerified' => AppLocalizations.of(context)!.errorEmailAlreadyVerified,
      'errorEmailNotVerified' => AppLocalizations.of(context)!.errorEmailNotVerified,
      'errorInvalidCredentials' => AppLocalizations.of(context)!.errorInvalidCredentials,
      'errorGoogleAuthUnsupported' => AppLocalizations.of(context)!.errorGoogleAuthUnsupported,
      'errorGoogleAuthToken' => AppLocalizations.of(context)!.errorGoogleAuthToken,
      'errorGoogleLoginFailed' => AppLocalizations.of(context)!.errorGoogleLoginFailed,
      'errorLinkEmpty' => AppLocalizations.of(context)!.errorLinkEmpty,
      'errorLinkInvalid' => AppLocalizations.of(context)!.errorLinkInvalid,
      'errorPasswordEmpty' => AppLocalizations.of(context)!.errorPasswordEmpty,
      'errorPasswordTooShort' => AppLocalizations.of(context)!.errorPasswordTooShort,
      'errorPasswordNoUppercase' => AppLocalizations.of(context)!.errorPasswordNoUppercase,
      'errorPasswordNoLowercase' => AppLocalizations.of(context)!.errorPasswordNoLowercase,
      'errorPasswordNoNumber' => AppLocalizations.of(context)!.errorPasswordNoNumber,
      'errorPasswordNoSpecialCharacter' => AppLocalizations.of(context)!.errorPasswordNoSpecialCharacter,
      'errorPhoneNumberEmpty' => AppLocalizations.of(context)!.errorPhoneNumberEmpty,
      'errorPhoneNumberInvalid' => AppLocalizations.of(context)!.errorPhoneNumberInvalid,
      'errorTokenEmpty' => AppLocalizations.of(context)!.errorTokenEmpty,
      'errorTokenInvalid' => AppLocalizations.of(context)!.errorTokenInvalid,
      'errorTokenExpired' => AppLocalizations.of(context)!.errorTokenExpired,
      'errorTokenCodeNotFound' => AppLocalizations.of(context)!.errorTokenCodeNotFound,
      'errorUserNameEmpty' => AppLocalizations.of(context)!.errorUserNameEmpty,
      'errorUserNameTooLong' => AppLocalizations.of(context)!.errorUserNameTooLong,
      'errorUserNameInvalidCharacters' => AppLocalizations.of(context)!.errorUserNameInvalidCharacters,
      'errorUserNameTooShort' => AppLocalizations.of(context)!.errorUserNameTooShort,
      _ => AppLocalizations.of(context)!.errorUnknown,
    };
  }
}
