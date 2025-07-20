import 'package:dio/dio.dart';

import 'package:inmo_mobile/core/errors/value_object_errors/connection_error.dart';

class ApiStatusInterceptor extends Interceptor {
  ApiStatusInterceptor();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final isAvailable = await _checkBackendHealth(options);
      if (!isAvailable) {
        return handler.reject(
          DioException(
            requestOptions: options,
            error: ConnectionError.backendIsUnavailable,
            type: DioExceptionType.connectionError,
          ),
        );
      }
    } catch (e) {
      return handler.reject(
        DioException(
          requestOptions: options,
          error: ConnectionError.connectionFailed,
          type: DioExceptionType.connectionError,
        ),
      );
    }

    // Continue with the request if backend is available
    handler.next(options);
  }

  Future<bool> _checkBackendHealth(RequestOptions options) async {
    try {
      // Create a temporary dio instance to avoid infinite loops
      final dio = Dio();
      final response = await dio.get(
        '${options.baseUrl}/Health',
        options: Options(receiveTimeout: const Duration(seconds: 3)),
      );
      return response.statusCode == 200;
    } catch (_) {
      return false;
    }
  }
}
