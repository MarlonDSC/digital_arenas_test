import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/value_object_errors/user_name_error.dart';

class Name {
  final String value;

  const Name._({required this.value});

  static Result<Name> create(String? value) {
    if (value == null || value.isEmpty) {
      return left([UserNameError.empty]);
    }
    if (value.length < 2) {
      return left([UserNameError.tooShort]);
    }
    if (value.length > 25) {
      return left([UserNameError.tooLong]);
    }

    String formattedValue = _toTitleCase(value);
    if (!RegExp(r"^[A-Za-zÀ-ÿ\s]{1,}[\.]{0,1}[A-Za-zÀ-ÿ\s]{0,}$").hasMatch(formattedValue)) {
      return left([UserNameError.invalidCharacters]);
    }

    return right(Name._(value: formattedValue));
  }

  static String _toTitleCase(String value) {
    return value.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }
}
