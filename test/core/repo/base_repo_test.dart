import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/errors/error_detail.dart';
import 'package:inmo_mobile/core/errors/error_field_detail.dart';
import 'package:inmo_mobile/core/repo/base_repo.dart';
import 'package:inmo_mobile/core/value_objects/error_type.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/retrofit.dart';

class MockBaseRepo extends Mock implements BaseRepo {
  @override
  Future<Result<T>> executeApiCall<T>({
    required Future<HttpResponse<dynamic>> Function() apiCall,
    int successStatusCode = 200,
    T Function(dynamic)? mapResponse,
  }) {
    return super.noSuchMethod(
      Invocation.method(
        #executeApiCall,
        [],
        {
          #apiCall: apiCall,
          #successStatusCode: successStatusCode,
          #mapResponse: mapResponse,
        },
      ),
      returnValue: Future.value(Right<List<ErrorFieldDetail>, T>(null as T)),
    );
  }
}

class TestBaseRepo extends BaseRepo {}

void main() {
  late TestBaseRepo baseRepo;

  setUp(() {
    baseRepo = TestBaseRepo();
  });

  group('executeApiCall', () {
    test('returns Right(data) when API call succeeds with expected status code', () async {
      // Arrange
      final responseData = {'key': 'value'};
      Future<HttpResponse<Map<String, dynamic>>> apiCall() async => HttpResponse<Map<String, dynamic>>(
            responseData,
            Response<Map<String, dynamic>>(
              requestOptions: RequestOptions(path: '/test'),
              statusCode: 200,
              data: responseData,
            ),
          );

      // Act
      final result = await baseRepo.executeApiCall<Map<String, dynamic>>(
        apiCall: apiCall,
      );

      // Assert
      result.fold(
        (l) => fail('Expected Right but got Left'),
        (r) => expect(r, equals(responseData)),
      );
    });

    test('returns Right(Unit) when API call succeeds and T is Unit', () async {
      // Arrange
      Future<HttpResponse<dynamic>> apiCall() async => HttpResponse<dynamic>(
            null,
            Response<dynamic>(
              requestOptions: RequestOptions(path: '/test'),
              statusCode: 200,
            ),
          );

      // Act
      final result = await baseRepo.executeApiCall<Unit>(
        apiCall: apiCall,
      );

      // Assert
      result.fold(
        (l) => fail('Expected Right but got Left'),
        (r) => expect(r, equals(unit)),
      );
    });

    test('returns Right(mappedData) when API call succeeds and mapResponse is provided', () async {
      // Arrange
      final responseData = {'id': '123', 'name': 'Test'};
      Future<HttpResponse<Map<String, dynamic>>> apiCall() async => HttpResponse<Map<String, dynamic>>(
            responseData,
            Response<Map<String, dynamic>>(
              requestOptions: RequestOptions(path: '/test'),
              statusCode: 200,
              data: responseData,
            ),
          );

      // Act
      final result = await baseRepo.executeApiCall<String>(
        apiCall: apiCall,
        mapResponse: (data) => data['id'] as String,
      );

      // Assert
      result.fold(
        (l) => fail('Expected Right but got Left'),
        (r) => expect(r, equals('123')),
      );
    });

    test('returns Left([ConnectionError.tooManyRequests]) when status code is 429', () async {
      // Arrange
      Future<HttpResponse<dynamic>> apiCall() async => throw DioException(
            requestOptions: RequestOptions(path: '/test'),
            response: Response(
              requestOptions: RequestOptions(path: '/test'),
              statusCode: 429,
            ),
            type: DioExceptionType.badResponse,
          );

      // Act
      final result = await baseRepo.executeApiCall<dynamic>(
        apiCall: apiCall,
      );

      // Assert
      result.fold(
        (l) {
          expect(l.length, equals(1));
          expect(l.first.code, equals('errorTooManyRequests'));
        },
        (r) => fail('Expected Left but got Right'),
      );
    });

    test('returns Left([ConnectionError.noInternetConnection]) on connection error', () async {
      // Arrange
      Future<HttpResponse<dynamic>> apiCall() async => throw DioException(
            requestOptions: RequestOptions(path: '/test'),
            type: DioExceptionType.connectionError,
          );

      // Act
      final result = await baseRepo.executeApiCall<dynamic>(
        apiCall: apiCall,
      );

      // Assert
      result.fold(
        (l) {
          expect(l.length, equals(1));
          expect(l.first.code, equals('errorNoInternetConnection'));
        },
        (r) => fail('Expected Left but got Right'),
      );
    });

    test('returns Left([ErrorFieldDetail]) when response data is a list of validation errors', () async {
      // Arrange
      final errorResponse = [
        {
          'code': 'invalidEmail',
          'description': 'Email is invalid',
          'field': 'email',
          'type': 0,
        }
      ];

      Future<HttpResponse<dynamic>> apiCall() async => throw DioException(
            requestOptions: RequestOptions(path: '/test'),
            response: Response(
              requestOptions: RequestOptions(path: '/test'),
              statusCode: 400,
              data: errorResponse,
            ),
            type: DioExceptionType.badResponse,
          );

      // Act
      final result = await baseRepo.executeApiCall<dynamic>(
        apiCall: apiCall,
      );

      // Assert
      result.fold(
        (l) {
          expect(l.length, equals(1));
          expect(
            l.first,
            equals(
              const ErrorFieldDetail(
                code: 'invalidEmail',
                description: 'Email is invalid',
                field: 'email',
                type: ErrorType.validation,
              ),
            ),
          );
        },
        (r) => fail('Expected Left but got Right'),
      );
    });

    test('returns Left([ErrorFieldDetail]) when response data is a JSON string of validation errors', () async {
      // Arrange
      final errorResponse = jsonEncode([
        {
          'code': 'invalidPassword',
          'description': 'Password is too short',
          'field': 'password',
          'type': 0,
        }
      ]);

      Future<HttpResponse<dynamic>> apiCall() async => throw DioException(
            requestOptions: RequestOptions(path: '/test'),
            response: Response(
              requestOptions: RequestOptions(path: '/test'),
              statusCode: 400,
              data: errorResponse,
            ),
            type: DioExceptionType.badResponse,
          );

      // Act
      final result = await baseRepo.executeApiCall<dynamic>(
        apiCall: apiCall,
      );

      // Assert
      result.fold(
        (l) {
          expect(l.length, equals(1));
          expect(
            l.first,
            equals(
              const ErrorFieldDetail(
                code: 'invalidPassword',
                description: 'Password is too short',
                field: 'password',
                type: ErrorType.validation,
              ),
            ),
          );
        },
        (r) => fail('Expected Left but got Right'),
      );
    });

    test('throws ErrorDetail.unknown() on unexpected error', () async {
      // Arrange
      Future<HttpResponse<dynamic>> apiCall() async => throw DioException(
            requestOptions: RequestOptions(path: '/test'),
            type: DioExceptionType.unknown,
          );

      // Act & Assert
      expect(
        () => baseRepo.executeApiCall<dynamic>(apiCall: apiCall),
        throwsA(const ErrorDetail.unknown()),
      );
    });
  });
}