import 'package:inmo_mobile/core/errors/error_detail.dart';

class EmailError {
  static const ErrorDetail empty = ErrorDetail.validation(
    'errorEmailEmpty',
    'Email is empty',
  );
  static const ErrorDetail invalid = ErrorDetail.validation(
    'errorEmailInvalid',
    'Email is invalid',
  );

  static const ErrorDetail tooLong = ErrorDetail.validation(
    'errorEmailTooLong',
    'Email is too long',
  );

  static const ErrorDetail alreadyExists = ErrorDetail.validation(
    'errorEmailAlreadyExists',
    'Email already exists',
  );

  static const ErrorDetail notFound = ErrorDetail.validation(
    'errorEmailNotFound',
    'Email not found',
  );

  static const ErrorDetail alreadyVerified = ErrorDetail.validation(
    'errorEmailAlreadyVerified',
    'Email already verified',
  );

  static const ErrorDetail emailNotVerified = ErrorDetail.validation(
    'errorEmailNotVerified',
    'Email not verified',
  );
  static const ErrorDetail invalidCredentials = ErrorDetail.validation(
    'errorInvalidCredentials',
    'Invalid credentials',
  );
}
