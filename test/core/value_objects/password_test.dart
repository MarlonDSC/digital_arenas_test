import 'package:flutter_test/flutter_test.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/value_object_errors/password_error.dart';
import 'package:inmo_mobile/core/value_objects/password.dart';

void main() {
  group('✅ Valid:', () {
    test(
      'Password with 10 characters, one uppercase, one lowercase, one number and one special character',
      () {
        var password = 'Password123!';
        final result = Password.create(password);
        expect(result.isSuccess, isTrue);
        result.mapValue((right) => expect(right.value, password));
      },
    );
  });

  group('❌ Invalid:', () {
    test('Password with no characters', () {
      var password = '';
      final result = Password.create(password);
      expect(result.isFailure, isTrue);
      expect(result.errors, [PasswordError.empty]);
    });

    test('Password with less than 10 characters', () {
      var password = 'short123';
      final result = Password.create(password);
      expect(result.isFailure, isTrue);
      expect(result.errors, [PasswordError.tooShort]);
    });

    test('Password with 10 characters and no uppercase', () {
      var password = 'password123';
      final result = Password.create(password);
      expect(result.isFailure, isTrue);
      expect(result.errors, [PasswordError.noUppercase]);
    });

    test('Password with 10 characters and no lowercase', () {
      var password = 'PASSWORD123';
      final result = Password.create(password);
      expect(result.isFailure, isTrue);
      expect(result.errors, [PasswordError.noLowercase]);
    });

    test('Password with 10 characters and no number', () {
      var password = 'Password!@';
      final result = Password.create(password);
      expect(result.isFailure, isTrue);
      expect(result.errors, [PasswordError.noNumber]);
    });

    test('Password with 10 characters and no special character', () {
      var password = 'Password123';
      final result = Password.create(password);
      expect(result.isFailure, isTrue);
      expect(result.errors, [PasswordError.noSpecialCharacter]);
    });
  });
}
