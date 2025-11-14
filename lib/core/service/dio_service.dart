
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:eyo_bingo/core/service/token_interceptor_service.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/io.dart';

class DioHttpClient {
  Dio client({bool requireAuth = false}) {
    final dio = Dio(
        BaseOptions(
            baseUrl: "",
            connectTimeout: Duration(seconds: 60),
            receiveTimeout: Duration(seconds: 60),
            sendTimeout: Duration(seconds: 60),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              // 'x-api-key':apiKey
            }
        ));

    // 🔐 Allow bad SSL certificates only in non-release mode
    if (!kReleaseMode) {
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        return HttpClient()
          ..badCertificateCallback = (
              X509Certificate cert,
              String host,
              int port,
              ) {
            // Log a warning (optional)
            log('⚠️ Accepting bad certificate from $host:$port');
            return true;
          };
      };
    }


    dio.interceptors.add(TokenInterceptor(requireAuth: requireAuth, dio: dio));
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      logPrint: (obj) {
        log(obj.toString());
      },
    ));
    return dio;
  }
}