import 'package:inmo_mobile/core/errors/error_detail.dart';

class UserNameError {
  static const ErrorDetail empty = ErrorDetail.validation(
    'errorUserNameEmpty',
    'User name is empty',
  );

  static const ErrorDetail tooLong = ErrorDetail.validation(
    'errorUserNameTooLong',
    'User name is too long',
  );

  static const ErrorDetail invalidCharacters = ErrorDetail.validation(
    'errorUserNameInvalidCharacters',
    'User name contains invalid characters',
  );

  static const ErrorDetail tooShort = ErrorDetail.validation(
    'errorUserNameTooShort',
    'User name is too short',
  );
}
