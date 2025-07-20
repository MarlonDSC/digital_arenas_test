import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/value_object_errors/country_code_error.dart';

class CountryCode {
  final String value;

  const CountryCode._({required this.value});

  static Result<CountryCode> create(String? value) {
    if (value == null || value.isEmpty) {
      return left([CountryCodeError.empty]);
    }
    if (!RegExp(r'\b[A-Z]{2}\b').hasMatch(value)) {
      return left([CountryCodeError.invalid]);
    }
    return right(CountryCode._(value: value));
  }

  static String prefix(String value) {
    return switch (value) {
      'DO' => '+1',
      'US' => '+1',
      _ => '+1',
    };
  }
}
