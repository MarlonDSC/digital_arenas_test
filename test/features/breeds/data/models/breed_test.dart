import 'package:flutter_test/flutter_test.dart';
import 'package:approval_tests/approval_tests.dart';
import 'package:inmo_mobile/features/breeds/data/models/breed.dart';

void main() {
  group('Breed', () {
    test('verify basic serialization', () {
      final breed = Breed(
        id: 1,
        name: 'Golden Retriever',
      );

      Approvals.verifyAsJson(
        breed,
        options: const Options(
          reporter: DiffReporter(),
        ),
      );
    });

    test('verify complex name serialization', () {
      final breed = Breed(
        id: 42,
        name: 'German Shepherd Dog',
      );

      Approvals.verifyAsJson(
        breed,
        options: const Options(
          reporter: DiffReporter(),
        ),
      );
    });

    test('verify JSON roundtrip', () {
      final originalBreed = Breed(
        id: 123,
        name: 'Labrador Retriever',
      );

      final json = originalBreed.toJson();
      final deserializedBreed = Breed.fromJson(json);

      Approvals.verifyAsJson(
        {
          'original': originalBreed,
          'serialized': json,
          'deserialized': deserializedBreed,
        },
        options: const Options(
          reporter: DiffReporter(),
        ),
      );
    });

    test('verify fromJson factory with sample payload', () {
      const json = {
        'id': 456,
        'name': 'Bulldog',
      };

      final breed = Breed.fromJson(json);

      Approvals.verifyAsJson(
        {
          'input': json,
          'parsed': breed,
        },
        options: const Options(
          reporter: DiffReporter(),
        ),
      );
    });
  });
}