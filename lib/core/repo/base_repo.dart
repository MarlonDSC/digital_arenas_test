import 'dart:developer';
import 'dart:io' show HttpStatus;
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:inmo_mobile/core/errors/value_object_errors/connection_error.dart';
import 'package:retrofit/retrofit.dart';
import 'package:inmo_mobile/core/constants/result.dart';
import 'package:inmo_mobile/core/errors/error_detail.dart';
import 'package:inmo_mobile/core/errors/error_field_detail.dart';
import 'package:inmo_mobile/core/value_objects/error_type.dart';

abstract class BaseRepo {
  /// Executes an API call with standardized error handling
  ///
  /// [apiCall] is the actual API call function to execute
  /// [successStatusCode] is the expected HTTP status code for success (defaults to 200 OK)
  /// Returns a [Result] containing either the successful response data or error details
  Future<Result<T>> executeApiCall<T>({
    required Future<HttpResponse<dynamic>> Function() apiCall,
    int successStatusCode = HttpStatus.ok,
    T Function(dynamic)? mapResponse,
  }) async {
    try {
      final response = await apiCall();

      if (response.response.statusCode == successStatusCode) {
        log('response: ${response.response.data}');
        return _handleSuccessResponse<T>(response, mapResponse);
      }

      throw DioException(
        requestOptions: response.response.requestOptions,
        error: ErrorDetail.fromJson(
          response.response.data as Map<String, dynamic>,
        ),
        type: DioExceptionType.badResponse,
      );
    } on DioException catch (e) {
      return _handleDioException<T>(e);
    }
  }

  Result<T> _handleSuccessResponse<T>(
    HttpResponse<dynamic> response,
    T Function(dynamic)? mapResponse,
  ) {
    if (T == Unit) {
      return Right(unit as T);
    }
    return Right(
      mapResponse != null ? mapResponse(response.data) : response.data as T,
    );
  }

  Result<T> _handleDioException<T>(DioException e) {
    if (e.response?.statusCode == 429) {
      return const Left([ConnectionError.tooManyRequests]);
    }

    if (e.type == DioExceptionType.connectionError) {
      var error = e.error;
      if (error != null && error is ErrorDetail) {
        return Left([error]);
      }
      return const Left([ConnectionError.noInternetConnection]);
    }

    var data = e.response?.data;

    if (data is String) {
      final parsedData = jsonDecode(data);
      if (parsedData is List) {
        var errorFieldDetails = _parseErrorFieldDetails(parsedData);
        return Left(errorFieldDetails);
      }
    }

    if (data is List) {
      var errorFieldDetails = _parseErrorFieldDetails(data);
      return Left(errorFieldDetails);
    }

    throw const ErrorDetail.unknown();
  }

  List<ErrorFieldDetail> _parseErrorFieldDetails(List<dynamic> data) {
    return data
        .map((e) => e is Map<String, dynamic> ? e : jsonDecode(e.toString()))
        .map((e) => ErrorFieldDetail.fromJson(e))
        .where((e) => e.type == ErrorType.validation)
        .toList();
  }
}
