import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  AppInterceptor();

  @override
  void onRequest( RequestOptions options,RequestInterceptorHandler handler,) {
    options.queryParameters.addAll({
      'apikey': const String.fromEnvironment('API_KEY'),
    });

    // ignore: avoid_print
    print('REQUEST => ${options.method} ${options.uri}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response,ResponseInterceptorHandler handler,) {
    // ignore: avoid_print
    print('RESPONSE => ${response.statusCode}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler,) {

    // ignore: avoid_print
    print('ERROR => ${err.message}');
    super.onError(err, handler);
  }
}