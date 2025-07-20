import 'package:json_annotation/json_annotation.dart';

enum ErrorType {
  @JsonValue(0)
  validation,
  @JsonValue(1)
  server,
  @JsonValue(2)
  permission,
  @JsonValue(3)
  unknown,
  @JsonValue(4)
  connection,
  @JsonValue(5)
  secureStorage,
  @JsonValue(6)
  db,
  @JsonValue(7)
  external
}