import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/errors/value_object_errors/email_error.dart';
import 'package:inmo_mobile/core/constants/result.dart';
class Email {
  final String value;

  const Email._({required this.value});

  static Result<Email> create(String? value) {
    if (value == null || value.isEmpty) {
      return left([EmailError.empty]);
    }
    if (value.length > 255) {
      return left([EmailError.tooLong]);
    }
    if (!RegExp(r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$").hasMatch(value)) {
      return left([EmailError.invalid]);
    }
    return right(Email._(value: value));
  }
}