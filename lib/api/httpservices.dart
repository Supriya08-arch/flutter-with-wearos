// Singleton Class

import 'package:dio/dio.dart';

import '../utils/url.dart';

class HttpServices {
  static final HttpServices _instance = HttpServices.internal();
  factory HttpServices() => _instance;
  HttpServices.internal();

  // DIO - http client -- dio does request and response work
  Dio? _dio;
  Dio getDioInstance() {
    if (_dio == null) {
      return Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 5000,
      ));
    } else {
      return _dio!;
    }
  }
}
