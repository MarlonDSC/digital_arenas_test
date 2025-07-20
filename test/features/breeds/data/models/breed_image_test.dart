import 'package:flutter_test/flutter_test.dart';
import 'package:approval_tests/approval_tests.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed_image.dart';

void main() {
  group('BreedImage', () {
    test('verify basic serialization', () {
      final breedImage = BreedImage(
        id: 'B1iWlZRXQ',
        url: 'https://images.dog.ceo/breeds/retriever-golden/n02099601_1024.jpg',
        width: 1024,
        height: 768,
        mimeType: 'image/jpeg',
      );

      Approvals.verifyAsJson(
        breedImage,
        options: const Options(
          reporter: DiffReporter(),
        ),
      );
    });

    test('verify serialization with null mimeType', () {
      final breedImage = BreedImage(
        id: 'B2iWlZRXQ',
        url: 'https://images.dog.ceo/breeds/retriever-golden/n02099601_1024.jpg',
        width: 800,
        height: 600,
        mimeType: null,
      );

      Approvals.verifyAsJson(
        breedImage,
        options: const Options(
          reporter: DiffReporter(),
        ),
      );
    });

    test('verify JSON roundtrip', () {
      final originalBreedImage = BreedImage(
        id: 'B3iWlZRXQ',
        url: 'https://images.dog.ceo/breeds/retriever-golden/n02099601_1024.jpg',
        width: 1200,
        height: 900,
        mimeType: 'image/png',
      );

      final json = originalBreedImage.toJson();
      final deserializedBreedImage = BreedImage.fromJson(json);

      Approvals.verifyAsJson(
        {
          'original': originalBreedImage,
          'serialized': json,
          'deserialized': deserializedBreedImage,
        },
        options: const Options(
          reporter: DiffReporter(),
        ),
      );
    });

    test('verify fromJson factory with sample payload', () {
      const json = {
        'id': 'B4iWlZRXQ',
        'url': 'https://images.dog.ceo/breeds/retriever-golden/n02099601_1024.jpg',
        'width': 640,
        'height': 480,
        'mime_type': 'image/jpeg',
      };

      final breedImage = BreedImage.fromJson(json);

      Approvals.verifyAsJson(
        {
          'input': json,
          'parsed': breedImage,
        },
        options: const Options(
          reporter: DiffReporter(),
        ),
      );
    });

    test('verify fromJson factory with null mimeType', () {
      const json = {
        'id': 'B5iWlZRXQ',
        'url': 'https://images.dog.ceo/breeds/retriever-golden/n02099601_1024.jpg',
        'width': 1920,
        'height': 1080,
      };

      final breedImage = BreedImage.fromJson(json);

      Approvals.verifyAsJson(
        {
          'input': json,
          'parsed': breedImage,
        },
        options: const Options(
          reporter: DiffReporter(),
        ),
      );
    });
  });
}