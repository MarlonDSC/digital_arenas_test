import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_dto.g.dart';

@JsonSerializable()
class BaseDto with EquatableMixin {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;

  BaseDto(this.id, this.createdAt, this.updatedAt);

  factory BaseDto.fromJson(Map<String, dynamic> json) =>
      _$BaseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$BaseDtoToJson(this);

  @override
  List<Object?> get props => [id, createdAt, updatedAt];
}
