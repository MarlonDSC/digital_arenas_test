import 'package:equatable/equatable.dart';
import 'package:inmo_mobile/core/value_objects/error_type.dart';

abstract class BaseError extends Equatable {
  final String code;
  final String description;
  final ErrorType type;

  const BaseError({
    required this.code,
    required this.description,
    required this.type,
  });

  bool isEqualToApiError(BaseError other) {
    return code == other.code && type == other.type;
  }

  @override
  List<Object?> get props => [code, description, type];
}
