import 'package:inmo_mobile/core/errors/base_error.dart';
import 'package:inmo_mobile/core/value_objects/error_type.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:inmo_mobile/core/errors/error_detail.dart';

part 'error_field_detail.g.dart';

@JsonSerializable(explicitToJson: true)
/// Used for objects coming from API
/// 
/// You'll see most tests written in JSON instead of using this class
/// since the test will verify it serializes and deserializes correctly
/// 
/// For in-app-errors see [ErrorDetail]
class ErrorFieldDetail extends BaseError {
  final String field;
  const ErrorFieldDetail({
    required super.code,
    required super.description,
    required super.type,
    required this.field,
  });

  @override
  List<Object?> get props => [code, description, type, field];

  factory ErrorFieldDetail.fromJson(Map<String, dynamic> json) =>
      _$ErrorFieldDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorFieldDetailToJson(this);
}
