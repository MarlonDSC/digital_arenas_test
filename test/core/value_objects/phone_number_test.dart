import 'package:flutter_test/flutter_test.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/value_object_errors/phone_number_error.dart';
import 'package:inmo_mobile/core/value_objects/country.dart';
import 'package:inmo_mobile/core/value_objects/country_code.dart';
import 'package:inmo_mobile/core/value_objects/phone_number.dart';

void main() {
  group('✅ Valid: ', () {
    test('Dominican Republic phone number with hyphens', () {
      var country = Country.DO;
      var countryCodeResult = CountryCode.create(country.value);
      expect(countryCodeResult.isSuccess, isTrue);

      countryCodeResult.fold((left) => expect(false, isTrue), (right) {
        var phoneNumber = '809-123-4567';
        final result = PhoneNumber.create(right, phoneNumber);
        expect(result.isSuccess, isTrue);
        result.mapValue((right) => expect(right.formatted, '+1 8091234567'));
      });
    });

    test('Dominican Republic phone number with spaces', () {
      var country = Country.DO;
      var countryCodeResult = CountryCode.create(country.value);
      expect(countryCodeResult.isSuccess, isTrue);

      countryCodeResult.fold((left) => expect(false, isTrue), (right) {
        var phoneNumber = '809 123 4567';
        final result = PhoneNumber.create(right, phoneNumber);
        expect(result.isSuccess, isTrue);
        result.mapValue((right) => expect(right.formatted, '+1 8091234567'));
      });
    });

    test('Dominican Republic phone number with parentheses', () {
      var country = Country.DO;
      var countryCodeResult = CountryCode.create(country.value);
      expect(countryCodeResult.isSuccess, isTrue);

      countryCodeResult.fold((left) => expect(false, isTrue), (right) {
        var phoneNumber = '(809) 123-4567';
        final result = PhoneNumber.create(right, phoneNumber);
        expect(result.isSuccess, isTrue);
        result.mapValue((right) => expect(right.formatted, '+1 8091234567'));
      });
    });

    test('Dominican Republic phone number without format', () {
      var country = Country.DO;
      var countryCodeResult = CountryCode.create(country.value);
      expect(countryCodeResult.isSuccess, isTrue);

      countryCodeResult.fold((left) => expect(false, isTrue), (right) {
        var phoneNumber = '8091234567';
        final result = PhoneNumber.create(right, phoneNumber);
        expect(result.isSuccess, isTrue);
        result.mapValue((right) => expect(right.formatted, '+1 8091234567'));
      });
    });
  });
  group('❌ Invalid: ', () {
    test('empty phone number', () {
      var country = Country.DO;
      var countryCodeResult = CountryCode.create(country.value);
      expect(countryCodeResult.isSuccess, isTrue);

      countryCodeResult.fold((left) => expect(false, isTrue), (right) {
        var phoneNumber = '';
        final result = PhoneNumber.create(right, phoneNumber);
        expect(result.isFailure, isTrue);
        expect(result.errors, [PhoneNumberError.empty]);
      });
    });

    test('invalid phone number', () {
      var country = Country.DO;
      var countryCodeResult = CountryCode.create(country.value);
      expect(countryCodeResult.isSuccess, isTrue);

      countryCodeResult.fold((left) => expect(false, isTrue), (right) {
        var phoneNumber = '30503301';
        final result = PhoneNumber.create(right, phoneNumber);
        expect(result.isFailure, isTrue);
        expect(result.errors, [PhoneNumberError.invalid]);
      });
    });

    test('Dominican Republic phone number with country code', () {
      var country = Country.DO;
      var countryCodeResult = CountryCode.create(country.value);
      expect(countryCodeResult.isSuccess, isTrue);

      countryCodeResult.fold((left) => expect(false, isTrue), (right) {
        var phoneNumber = '+1 809 123-4567';
        final result = PhoneNumber.create(right, phoneNumber);
        expect(result.isFailure, isTrue);
        expect(result.errors, [PhoneNumberError.invalid]);
      });
    });

    test('Dominican Republic phone number with country code and hyphens', () {
      var country = Country.DO;
      var countryCodeResult = CountryCode.create(country.value);
      expect(countryCodeResult.isSuccess, isTrue);

      countryCodeResult.fold((left) => expect(false, isTrue), (right) {
        var phoneNumber = '+1-809-123-4567';
        final result = PhoneNumber.create(right, phoneNumber);
        expect(result.isFailure, isTrue);
        expect(result.errors, [PhoneNumberError.invalid]);
      });
    });

    test('Dominican Republic phone number with country code and spaces', () {
      var country = Country.DO;
      var countryCodeResult = CountryCode.create(country.value);
      expect(countryCodeResult.isSuccess, isTrue);

      countryCodeResult.fold((left) => expect(false, isTrue), (right) {
        var phoneNumber = '+1 809 123-4567';
        final result = PhoneNumber.create(right, phoneNumber);
        expect(result.isFailure, isTrue);
        expect(result.errors, [PhoneNumberError.invalid]);
      });
    });

    test(
      'Dominican Republic phone number with country code and parentheses',
      () {
        var country = Country.DO;
        var countryCodeResult = CountryCode.create(country.value);
        expect(countryCodeResult.isSuccess, isTrue);

        countryCodeResult.fold((left) => expect(false, isTrue), (right) {
          var phoneNumber = '+1 (809) 123-4567';
          final result = PhoneNumber.create(right, phoneNumber);
          expect(result.isFailure, isTrue);
          expect(result.errors, [PhoneNumberError.invalid]);
        });
      },
    );
  });
}
