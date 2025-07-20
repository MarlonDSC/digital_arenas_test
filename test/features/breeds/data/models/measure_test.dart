import 'package:flutter_test/flutter_test.dart';
import 'package:approval_tests/approval_tests.dart';
import 'package:inmo_mobile/features/breeds/data/models/measure.dart';

void main() {
  group('Measure', () {
    test('verify basic serialization', () {
      final measure = Measure(
        imperial: '50-75 lbs',
        metric: '23-34 kg',
      );

      Approvals.verifyAsJson(
        measure,
        options: const Options(
          reporter: DiffReporter(),
        ),
      );
    });

    test('verify complex measurement serialization', () {
      final measure = Measure(
        imperial: '22-25 inches',
        metric: '56-64 cm',
      );

      Approvals.verifyAsJson(
        measure,
        options: const Options(
          reporter: DiffReporter(),
        ),
      );
    });

    test('verify JSON roundtrip', () {
      final originalMeasure = Measure(
        imperial: '60-80 lbs',
        metric: '27-36 kg',
      );

      final json = originalMeasure.toJson();
      final deserializedMeasure = Measure.fromJson(json);

      Approvals.verifyAsJson(
        {
          'original': originalMeasure,
          'serialized': json,
          'deserialized': deserializedMeasure,
        },
        options: const Options(
          reporter: DiffReporter(),
        ),
      );
    });

    test('verify fromJson factory with sample payload', () {
      const json = {
        'imperial': '20-25 inches',
        'metric': '51-64 cm',
      };

      final measure = Measure.fromJson(json);

      Approvals.verifyAsJson(
        {
          'input': json,
          'parsed': measure,
        },
        options: const Options(
          reporter: DiffReporter(),
        ),
      );
    });
  });
}