import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/value_object_errors/email_error.dart';
import 'package:inmo_mobile/core/value_objects/email.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('✅ Valid:', () {
    test('email without special characters', () {
      var email = 'test@test.com';
      var result = Email.create(email);
      expect(result.isSuccess, isTrue);
      result.mapValue((right) => expect(right.value, email));
    });

    test('email with special characters', () {
      var email = "user+tag!#\$%&'*+-/=?^_`{|}~@example.com";
      var result = Email.create(email);
      expect(result.isSuccess, isTrue);
      result.mapValue((right) => expect(right.value, email));
    });

    test('email with special characters and date', () {
      var date = DateTime.now();
      var formattedDate =
          '${date.year}_${date.month}_${date.day}_${date.hour}_${date.minute}_${date.second}';
      var email = "test$formattedDate@integrationtest.com";
      var result = Email.create(email);
      expect(result.isSuccess, isTrue);
      result.mapValue((right) => expect(right.value, email));
    });
  });

  group('❌ Invalid:', () {
    test('empty email', () {
      var email = '';
      var result = Email.create(email);
      expect(result.isFailure, isTrue);
      expect(result.errors, [EmailError.empty]);
    });

    test('email without a symbol', () {
      const email = 'testtest.com';
      var result = Email.create(email);
      expect(result.isFailure, isTrue);
      expect(result.errors, [EmailError.invalid]);
    });

    test('email with invalid domain', () {
      var email = 'test@test';
      var result = Email.create(email);
      expect(result.isFailure, isTrue);
      expect(result.errors, [EmailError.invalid]);
    });

    test('email exceeding max length', () {
      var email = '${List.generate(256, (index) => 'a').join('@')}.com';
      var result = Email.create(email);
      expect(result.isFailure, isTrue);
      expect(result.errors, [EmailError.tooLong]);
    });

    test('null email', () {
      var result = Email.create(null);
      expect(result.isFailure, isTrue);
      expect(result.errors, [EmailError.empty]);
    });

    test('internationalized email', () {
      var email = '用户@例子.测试';
      var result = Email.create(email);
      expect(result.isFailure, isTrue);
      expect(result.errors, [EmailError.invalid]);
    });

    test('email with invalid characters', () {
      var email = 'test@test.com/test';
      var result = Email.create(email);
      expect(result.isFailure, isTrue);
      expect(result.errors, [EmailError.invalid]);
    });
  });
}
