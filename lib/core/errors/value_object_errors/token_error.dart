import 'package:inmo_mobile/core/errors/error_detail.dart';

class TokenError {
  static const ErrorDetail empty = ErrorDetail.validation(
    'errorTokenEmpty',
    'Token is empty',
  );

  static const ErrorDetail invalid = ErrorDetail.validation(
    'errorTokenInvalid',
    'Token is invalid',
  );

  static const ErrorDetail expired = ErrorDetail.validation(
    'errorTokenExpired',
    'Token expired',
  );

  static const ErrorDetail codeNotFound = ErrorDetail.validation(
    'errorTokenCodeNotFound',
    'Token code not found',
  );
}