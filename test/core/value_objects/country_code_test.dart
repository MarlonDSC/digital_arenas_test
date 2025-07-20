import 'package:flutter_test/flutter_test.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/value_object_errors/country_code_error.dart';
import 'package:inmo_mobile/core/value_objects/country.dart';
import 'package:inmo_mobile/core/value_objects/country_code.dart';

void main() {
  group('✅ Valid:', () {
    test('Dominican Republic country code', () {
      var countryCode = Country.DO.value;
      final result = CountryCode.create(countryCode);
      expect(result.isSuccess, isTrue);
      result.mapValue((right) => expect(right.value, countryCode));
    });

    test('United States country code', () {
      var countryCode = Country.US.value;
      final result = CountryCode.create(countryCode);
      expect(result.isSuccess, isTrue);
      result.mapValue((right) => expect(right.value, countryCode));
    });

    test('Guatemala country code', () {
      var countryCode = Country.GT.value;
      final result = CountryCode.create(countryCode);
      expect(result.isSuccess, isTrue);
      result.mapValue((right) => expect(right.value, countryCode));
    });
  });

  group('❌ Invalid:', () {
    test('empty country code', () {
      var countryCode = '';
      final result = CountryCode.create(countryCode);
      expect(result.isFailure, isTrue);
      expect(result.errors, [CountryCodeError.empty]);
    });

    test('invalid country code', () {
      var countryCode = 'DO1';
      final result = CountryCode.create(countryCode);
      expect(result.isFailure, isTrue);
      expect(result.errors, [CountryCodeError.invalid]);
    });
  });
}
