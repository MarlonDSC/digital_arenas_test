import 'package:json_annotation/json_annotation.dart';

part 'measure.g.dart';

@JsonSerializable()
class Measure {
  final String imperial;
  final String metric;

  Measure({required this.imperial, required this.metric});

  factory Measure.fromJson(Map<String, dynamic> json) => _$MeasureFromJson(json);
  Map<String, dynamic> toJson() => _$MeasureToJson(this);
}

