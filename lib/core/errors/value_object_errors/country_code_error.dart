import 'package:inmo_mobile/core/errors/error_detail.dart';

class CountryCodeError {
  static const ErrorDetail empty = ErrorDetail.validation(
    'errorCountryCodeEmpty',
    'Country code is empty',
  );
  static const ErrorDetail invalid = ErrorDetail.validation(
    'errorCountryCodeInvalid',
    'Country code is invalid',
  );
}
