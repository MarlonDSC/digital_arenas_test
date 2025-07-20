import 'package:json_annotation/json_annotation.dart';

part 'breed_image.g.dart';

@JsonSerializable()
class BreedImage {
  final String id;
  final String url;
  final int width;
  final int height;
  @JsonKey(name: 'mime_type')
  final String? mimeType;

  BreedImage({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
    required this.mimeType,
  });

  factory BreedImage.fromJson(Map<String, dynamic> json) => _$BreedImageFromJson(json);
  Map<String, dynamic> toJson() => _$BreedImageToJson(this);
}