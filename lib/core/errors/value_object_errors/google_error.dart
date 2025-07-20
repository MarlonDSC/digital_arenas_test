import 'package:inmo_mobile/core/errors/error_detail.dart';

class GoogleError {
  static const ErrorDetail authUnsupported = ErrorDetail.external(
    'errorGoogleAuthUnsupported',
    'Google authentication not supported',
  );

  static const ErrorDetail authToken = ErrorDetail.external(
    'errorGoogleAuthToken',
    'An error ocurred while getting Google Token',
  );

  static const ErrorDetail loginFailed = ErrorDetail.external(
    'errorGoogleLoginFailed',
    'An error ocurred while login with Google',
  );

  static ErrorDetail unknown(Object e, StackTrace s) => ErrorDetail.stackTrace(
    'errorGoogleLoginFailed',
    'An error ocurred while login with Google',
    e,
    s,
  );
}
