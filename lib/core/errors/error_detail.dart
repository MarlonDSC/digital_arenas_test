import 'package:inmo_mobile/core/errors/base_error.dart';
import 'package:inmo_mobile/core/errors/value_object_errors/google_error.dart';
import 'package:inmo_mobile/core/value_objects/error_type.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:inmo_mobile/core/errors/error_field_detail.dart';

part 'error_detail.g.dart';

@JsonSerializable(explicitToJson: true)
/// Used for in-app-errors
/// For errors coming from the API see [ErrorFieldDetail]
class ErrorDetail extends BaseError {
  const ErrorDetail({
    required super.code,
    required super.description,
    required super.type,
  });

  /// Used for errors related to data validation (e.g., form validation, input validation)
  const ErrorDetail.validation(String code, String description)
    : super(code: code, description: description, type: ErrorType.validation);

  /// Used for errors ocurred in UseCases
  const ErrorDetail.server(
    String code,
    String description,
    Object e,
    StackTrace s,
  ) : super(
        code: code,
        description: '$description \n $e \n $s',
        type: ErrorType.unknown,
      );

  /// Used for errors related to network connection
  const ErrorDetail.connection(String code, String description)
    : super(code: code, description: description, type: ErrorType.connection);

  /// Used for errors related to local storage kvp
  const ErrorDetail.secureStorage(String code, String description)
    : super(
        code: code,
        description: description,
        type: ErrorType.secureStorage,
      );

  /// Used for errors related to local database
  const ErrorDetail.db(String code, String description)
    : super(code: code, description: description, type: ErrorType.db);

  /// Used for errors from third-party services (e.g., Google Maps, Google Sign in)
  /// 
  /// This errors are known and are documented
  /// 
  /// Example:
  /// 1. [GoogleError.authUnsupported]
  /// 2. [GoogleError.authToken]
  const ErrorDetail.external(String code, String description)
    : super(code: code, description: description, type: ErrorType.external);

  /// Used for:
  /// 1. Mocking errors in tests
  /// 2. API uncatched errors
  const ErrorDetail.unknown([String? code, String? description])
    : super(
        code: code ?? 'unknownError',
        description: description ?? 'Unknown error',
        type: ErrorType.unknown,
      );

  /// Used for from third-party services where the error is unknown 
  /// 
  /// Example: [GoogleError.unknown]
  const ErrorDetail.stackTrace(
    String code,
    String description,
    Object e,
    StackTrace s,
  ) : super(
        code: code,
        description: '$description \n $e \n $s',
        type: ErrorType.unknown,
      );

  /// Used when the app lacks required permission
  const ErrorDetail.permission(String code, String description)
    : super(code: code, description: description, type: ErrorType.permission);

  factory ErrorDetail.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDetailToJson(this);
}
