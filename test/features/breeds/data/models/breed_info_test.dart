import 'package:flutter_test/flutter_test.dart';
import 'package:approval_tests/approval_tests.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed_info.dart';
import 'package:inmo_mobile/features/breeds/data/models/measure.dart';
import 'package:inmo_mobile/features/favourite/data/models/favourite.dart';

void main() {
  group('BreedInfo', () {
    test('verify basic serialization', () {
      final breedInfo = BreedInfo(
        id: 1,
        name: 'Golden Retriever',
        weight: Measure(imperial: '55-75 lbs', metric: '25-34 kg'),
        height: Measure(imperial: '21.5-24 inches', metric: '55-61 cm'),
        lifeSpan: '10-12 years',
        bredFor: 'Retrieving game for hunters',
        breedGroup: 'Sporting',
        temperament: 'Intelligent, Kind, Reliable',
        referenceImageId: 'B1iWlZRXQ',
      );

      Approvals.verifyAsJson(
        breedInfo,
        options: const Options(
          reporter: DiffReporter(),
        ),
      );
    });

    test('verify serialization with null optional fields', () {
      final breedInfo = BreedInfo(
        id: 2,
        name: 'Mixed Breed',
        weight: Measure(imperial: '30-50 lbs', metric: '14-23 kg'),
        height: Measure(imperial: '18-22 inches', metric: '46-56 cm'),
        lifeSpan: null,
        bredFor: null,
        breedGroup: null,
        temperament: null,
        referenceImageId: 'B2iWlZRXQ',
      );

      Approvals.verifyAsJson(
        breedInfo,
        options: const Options(
          reporter: DiffReporter(),
        ),
      );
    });

    test('verify JSON roundtrip', () {
      final originalBreedInfo = BreedInfo(
        id: 3,
        name: 'Labrador Retriever',
        weight: Measure(imperial: '55-80 lbs', metric: '25-36 kg'),
        height: Measure(imperial: '21.5-24.5 inches', metric: '55-62 cm'),
        lifeSpan: '10-12 years',
        bredFor: 'Retrieving game for hunters',
        breedGroup: 'Sporting',
        temperament: 'Intelligent, Even Tempered, Kind',
        referenceImageId: 'B3iWlZRXQ',
      );

      final json = originalBreedInfo.toJson();
      final deserializedBreedInfo = BreedInfo.fromJson(json);

      Approvals.verifyAsJson(
        {
          'original': originalBreedInfo,
          'serialized': json,
          'deserialized': deserializedBreedInfo,
        },
        options: const Options(
          reporter: DiffReporter(),
        ),
      );
    });

    test('verify fromJson factory with sample payload', () {
      const json = {
        'id': 4,
        'name': 'German Shepherd',
        'weight': {
          'imperial': '50-90 lbs',
          'metric': '23-41 kg',
        },
        'height': {
          'imperial': '22-26 inches',
          'metric': '56-66 cm',
        },
        'life_span': '7-10 years',
        'bred_for': 'Herding sheep',
        'breed_group': 'Herding',
        'temperament': 'Loyal, Confident, Courageous',
        'reference_image_id': 'B4iWlZRXQ',
      };

      final breedInfo = BreedInfo.fromJson(json);

      Approvals.verifyAsJson(
        {
          'input': json,
          'parsed': breedInfo,
        },
        options: const Options(
          reporter: DiffReporter(),
        ),
      );
    });

    test('verify fromFavourite factory method', () {
      final favourite = Favourite(
        favouriteName: 'My Golden',
        breedId: 5,
        breedName: 'Golden Retriever',
        breedImperialWeight: '55-75 lbs',
        breedMetricWeight: '25-34 kg',
        breedImperialHeight: '21.5-24 inches',
        breedMetricHeight: '55-61 cm',
        breedLifeSpan: '10-12 years',
        breedBredFor: 'Retrieving game for hunters',
        breedBreedGroup: 'Sporting',
        breedTemperament: 'Intelligent, Kind, Reliable',
        breedImageId: 'B5iWlZRXQ',
      );

      final breedInfo = BreedInfo.fromFavourite(favourite);

      Approvals.verifyAsJson(
        {
          'input_favourite': favourite,
          'converted_breed_info': breedInfo,
        },
        options: const Options(
          reporter: DiffReporter(),
        ),
      );
    });

    test('verify fromFavourite factory method with null fields', () {
      final favourite = Favourite(
        favouriteName: 'My Mixed',
        breedId: 6,
        breedName: 'Mixed Breed',
        breedImperialWeight: '30-50 lbs',
        breedMetricWeight: '14-23 kg',
        breedImperialHeight: '18-22 inches',
        breedMetricHeight: '46-56 cm',
        breedLifeSpan: null,
        breedBredFor: null,
        breedBreedGroup: null,
        breedTemperament: null,
        breedImageId: 'B6iWlZRXQ',
      );

      final breedInfo = BreedInfo.fromFavourite(favourite);

      Approvals.verifyAsJson(
        {
          'input_favourite': favourite,
          'converted_breed_info': breedInfo,
        },
        options: const Options(
          reporter: DiffReporter(),
        ),
      );
    });
  });
}