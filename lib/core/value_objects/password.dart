import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/value_object_errors/password_error.dart';

class Password {
  final String value;

  const Password._(this.value);

  static Result<Password> create(String? value) {
    if (value == null || value.isEmpty) {
      return left([PasswordError.empty]);
    }

    if (value.length < 10) {
      return left([PasswordError.tooShort]);
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return left([PasswordError.noUppercase]);
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return left([PasswordError.noLowercase]);
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return left([PasswordError.noNumber]);
    }

    if (!value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
      return left([PasswordError.noSpecialCharacter]);
    }

    return right(Password._(value));
  }
}
