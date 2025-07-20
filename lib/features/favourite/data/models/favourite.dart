import 'package:inmo_mobile/features/breeds/data/models/breed_info.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Favourite {
  @Id()
  int id = 0;
  late String favouriteName;
  late int breedId;
  late String breedName;
  late String breedImperialWeight;
  late String breedMetricWeight;
  late String breedImperialHeight;
  late String breedMetricHeight;
  late String? breedLifeSpan;
  late String? breedBredFor;
  late String? breedBreedGroup;
  late String? breedTemperament;
  late String breedImageId;

  Favourite({
    this.id = 0,
    required this.favouriteName,
    required this.breedId,
    required this.breedName,
    required this.breedImperialWeight,
    required this.breedMetricWeight,
    required this.breedImperialHeight,
    required this.breedMetricHeight,
    required this.breedLifeSpan,
    required this.breedBredFor,
    required this.breedBreedGroup,
    required this.breedTemperament,
    required this.breedImageId,
  });

  factory Favourite.fromBreedInfo(String name, BreedInfo breedInfo) {
    return Favourite(
      favouriteName: name,
      breedId: breedInfo.id,
      breedName: breedInfo.name,
      breedImperialWeight: breedInfo.weight.imperial,
      breedMetricWeight: breedInfo.weight.metric,
      breedImperialHeight: breedInfo.height.imperial,
      breedMetricHeight: breedInfo.height.metric,
      breedLifeSpan: breedInfo.lifeSpan,
      breedBredFor: breedInfo.bredFor ?? '',
      breedBreedGroup: breedInfo.breedGroup,
      breedTemperament: breedInfo.temperament,
      breedImageId: breedInfo.referenceImageId,
    );
  }
}
