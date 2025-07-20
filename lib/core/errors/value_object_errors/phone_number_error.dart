import 'package:inmo_mobile/core/errors/error_detail.dart';

class PhoneNumberError {
  static const ErrorDetail empty = ErrorDetail.validation(
    'errorPhoneNumberEmpty',
    'Phone number is empty',
  );

  static const ErrorDetail invalid = ErrorDetail.validation(
    'errorPhoneNumberInvalid',
    'Phone number is invalid',
  );
}
