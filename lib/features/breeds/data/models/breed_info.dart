import 'package:inmo_mobile/features/breeds/data/models/measure.dart';
import 'package:inmo_mobile/features/favourite/data/models/favourite.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breed_info.g.dart';

@JsonSerializable()
class BreedInfo {
  final int id;
  final String name;
  final Measure weight;
  final Measure height;
  @JsonKey(name: 'life_span')
  final String? lifeSpan;
  @JsonKey(name: 'bred_for')
  final String? bredFor;
  @JsonKey(name: 'breed_group')
  final String? breedGroup;
  final String? temperament;
  @JsonKey(name: 'reference_image_id')
  final String referenceImageId;

  BreedInfo({
    required this.id,
    required this.name,
    required this.weight,
    required this.height,
    required this.lifeSpan,
    required this.bredFor,
    required this.breedGroup,
    required this.temperament,
    required this.referenceImageId,
  });

  factory BreedInfo.fromFavourite(Favourite favourite) {
    return BreedInfo(
      id: favourite.breedId,
      name: favourite.breedName,
      weight: Measure(
        imperial: favourite.breedImperialWeight,
        metric: favourite.breedMetricWeight,
      ),
      height: Measure(
        imperial: favourite.breedImperialHeight,
        metric: favourite.breedMetricHeight,
      ),
      lifeSpan: favourite.breedLifeSpan,
      bredFor: favourite.breedBredFor,
      breedGroup: favourite.breedBreedGroup,
      temperament: favourite.breedTemperament,
      referenceImageId: favourite.breedImageId,
    );
  }

  factory BreedInfo.fromJson(Map<String, dynamic> json) =>
      _$BreedInfoFromJson(json);
  Map<String, dynamic> toJson() => _$BreedInfoToJson(this);
}
