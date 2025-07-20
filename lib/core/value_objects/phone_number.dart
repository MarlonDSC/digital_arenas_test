import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/value_object_errors/phone_number_error.dart';
import 'package:inmo_mobile/core/value_objects/country_code.dart';

class PhoneNumber {
  final CountryCode countryCode;
  final String digits;

  const PhoneNumber._({required this.countryCode, required this.digits});

  String get formatted => '${CountryCode.prefix(countryCode.value)} $digits';

  static Result<PhoneNumber> create(
    CountryCode countryCode,
    String? phoneNumber,
  ) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return left([PhoneNumberError.empty]);
    }

    var digits = extractDigits(phoneNumber);
    if (!isValidPhoneNumber(countryCode.value, digits)) {
      return left([PhoneNumberError.invalid]);
    }

    return right(PhoneNumber._(countryCode: countryCode, digits: digits));
  }

  static String extractDigits(String phoneNumber) {
    return phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
  }

  static bool isValidPhoneNumber(String countryCode, String phoneNumber) {
    return switch (countryCode) {
      'DO' => phoneNumber.length == 10,
      'US' => phoneNumber.length == 10,
      'GT' => phoneNumber.length == 8,
      _ => phoneNumber.length > 6 && phoneNumber.length < 15,
    };
  }
}
