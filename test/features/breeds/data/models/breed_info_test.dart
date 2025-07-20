import 'package:flutter_test/flutter_test.dart';
import 'package:approval_tests/approval_tests.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed_info.dart';
import 'package:inmo_mobile/features/breeds/data/models/measure.dart';

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
  });
}