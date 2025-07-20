import 'package:flutter_test/flutter_test.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/value_object_errors/user_name_error.dart';
import 'package:inmo_mobile/core/value_objects/name.dart';

void main() {
  group('✅ Valid:', () {
    test('valid first and middle name', () {
      var name = 'John Doe';
      var result = Name.create(name);
      expect(result.isSuccess, isTrue);
      result.mapValue((right) => expect(right.value, name));
    });

    test('valid short first name', () {
      var name = 'Xi';
      var result = Name.create(name);
      expect(result.isSuccess, isTrue);
      result.mapValue((right) => expect(right.value, name));
    });

    test('lowercase name formats to title case', () {
      var name = 'john doe';
      var result = Name.create(name);
      expect(result.isSuccess, isTrue);
      result.mapValue((right) => expect(right.value, 'John Doe'));
    });

    test('valid latin characters first and middle name', () {
      var name = 'Marlon Subuyú';
      var result = Name.create(name);
      expect(result.isSuccess, isTrue);
      result.mapValue((right) => expect(right.value, name));
    });
  });

  group('❌ Invalid:', () {
    test('empty name', () {
      var name = '';
      var result = Name.create(name);
      expect(result.isFailure, isTrue);
      expect(result.errors, [UserNameError.empty]);
    });

    test('name too long', () {
      var name = 'a' * 26;
      var result = Name.create(name);
      expect(result.isFailure, isTrue);
      expect(result.errors, [UserNameError.tooLong]);
    });

    test('name with invalid characters', () {
      var name = 'John@Doe';
      var result = Name.create(name);
      // expect(result.isFailure, isTrue);
      expect(result.errors, [UserNameError.invalidCharacters]);
    });

    test('name too short', () {
      var name = 'X';
      var result = Name.create(name);
      expect(result.isFailure, isTrue);
      expect(result.errors, [UserNameError.tooShort]);
    });
  });
}
