import 'package:inmo_mobile/core/errors/error_detail.dart';

class LinkError {
  static const ErrorDetail empty = ErrorDetail.validation(
    'errorLinkEmpty',
    'Link is empty',
  );
  static const ErrorDetail invalid = ErrorDetail.validation(
    'errorLinkInvalid',
    'Link is invalid',
  );
}
