import 'dart:io';

import 'package:olearistest/core/utils/constants.dart';
import 'package:olearistest/data/database/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

const bool isLogDio = true;

@module
abstract class RegisterModule {
  @preResolve
  Future<Dio> pref(SecureStorage secureStorage) async {
    late Dio dio;
    final options = BaseOptions(
      baseUrl: Constants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 120),
    );
    dio = Dio(options);
    dio.interceptors.add(
      HttpFormatter(
        includeRequest: isLogDio,
        includeRequestBody: isLogDio,
        includeRequestHeaders: isLogDio,
        includeRequestQueryParams: isLogDio,
        includeResponse: isLogDio,
        includeResponseHeaders: isLogDio,
        includeResponseBody: isLogDio,
        logger: Logger(),
        loggingFilter: (request, response, error) => true,
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) async {
          return handler.next(request);
        },
      ),
    );
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient =
        () => HttpClient()..badCertificateCallback = (X509Certificate cert, String host, int port) => true;

    return dio;
  }
}
