import 'package:inmo_mobile/core/errors/error_detail.dart';

class ConnectionError {
  static const ErrorDetail noInternetConnection = ErrorDetail.connection(
    'errorNoInternetConnection',
    'No internet connection',
  );
  static const ErrorDetail backendIsUnavailable = ErrorDetail.connection(
    'errorBackendIsUnavailable',
    'Backend is unavailable',
  );
  static const ErrorDetail connectionFailed = ErrorDetail.connection(
    'errorConnectionFailed',
    'Connection failed',
  );
  static const ErrorDetail tooManyRequests = ErrorDetail.connection(
    'errorTooManyRequests',
    'Too many requests',
  );
}
