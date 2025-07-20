import 'package:inmo_mobile/core/errors/error_detail.dart';

class PasswordError {
  static const ErrorDetail empty = ErrorDetail.validation(
    'errorPasswordEmpty',
    'Password is empty',
  );

  static const ErrorDetail tooShort = ErrorDetail.validation(
    'errorPasswordTooShort',
    'Password is too short',
  );

  static const ErrorDetail noUppercase = ErrorDetail.validation(
    'errorPasswordNoUppercase',
    'Password must contain at least one uppercase letter',
  );

  static const ErrorDetail noLowercase = ErrorDetail.validation(
    'errorPasswordNoLowercase',
    'Password must contain at least one lowercase letter',
  );

  static const ErrorDetail noNumber = ErrorDetail.validation(
    'errorPasswordNoNumber',
    'Password must contain at least one number',
  );

  static const ErrorDetail noSpecialCharacter = ErrorDetail.validation(
    'errorPasswordNoSpecialCharacter',
    'Password must contain at least one special character',
  );
}