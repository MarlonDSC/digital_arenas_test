import 'package:dio/dio.dart';

class KeyInterceptor extends Interceptor {
  final String key;

  KeyInterceptor(this.key);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-API-KEY'] = key;
    super.onRequest(options, handler);
  }
}