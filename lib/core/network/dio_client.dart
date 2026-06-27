import 'package:dio/dio.dart';
import '../config/env/environment_config.dart';
import '../constants/app_constants.dart';
import 'dio_interceptor.dart';

class DioClient {
  DioClient._();
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: EnvironmentConfig.config.baseUrl,
        connectTimeout: Duration(
          seconds: AppConstants.connectTimeout,
        ),
        receiveTimeout: Duration(
          seconds: AppConstants.receiveTimeout,
        ),
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      AppInterceptor(),
    );

    return dio;
  }
}