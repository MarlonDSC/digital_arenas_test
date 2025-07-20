import 'package:flutter_test/flutter_test.dart';
import 'package:inmo_mobile/core/errors/error_field_detail.dart';
import 'package:inmo_mobile/core/value_objects/error_type.dart';

void main() {
  test('error field detail ...', () {
    var json = {
      'trace': 'RegisterUserUseCase.Email',
      'code': 'emailAlreadyRegistered',
      'description': 'The email is already registered',
      'field': 'Email',
      'type': 0,
    };

    var fromJson = ErrorFieldDetail.fromJson(json);
    var object = const ErrorFieldDetail(
      code: 'emailAlreadyRegistered',
      description: 'The email is already registered',
      field: 'Email',
      type: ErrorType.validation,
    );

    expect(fromJson, object);
  });

  // Creat ea test for a list of error field details
  test('error field detail list ...', () {
    var jsonList = [
      {
        'trace': 'RegisterUserUseCase.Email',
        'code': 'emailAlreadyRegistered',
        'description': 'The email is already registered',
        'field': 'Email',
        'type': 0,
      },
      {
        'trace': 'RegisterUserUseCase.PhoneNumber',
        'code': 'phoneNumberAlreadyRegistered',
        'description': 'The phone number is already registered',
        'field': 'PhoneNumber',
        'type': 0,
      },
    ];

    var fromJsonList = jsonList
        .map((e) => ErrorFieldDetail.fromJson(e))
        .toList();
    var objectList = [
      const ErrorFieldDetail(
        code: 'emailAlreadyRegistered',
        description: 'The email is already registered',
        field: 'Email',
        type: ErrorType.validation,
      ),
      const ErrorFieldDetail(
        code: 'phoneNumberAlreadyRegistered',
        description: 'The phone number is already registered',
        field: 'PhoneNumber',
        type: ErrorType.validation,
      ),
    ];

    expect(fromJsonList, objectList);
  });
}
