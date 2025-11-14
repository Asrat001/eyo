import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../../di.dart';
import 'local_storage_service.dart';

class TokenRefreshService {


  LocalStorageService localStorageService = sl<LocalStorageService>();
  // Flag to prevent multiple refresh attempts at the same time
  bool _isRefreshing = false;

  // Completer to track ongoing refresh operation
  Completer<String?>? _refreshCompleter;

  Future<String?> refreshToken() async {
    // If already refreshing, return the same future
    if (_isRefreshing && _refreshCompleter != null) {
      return _refreshCompleter!.future;
    }

    _refreshCompleter = Completer<String?>();
    _isRefreshing = true;

    try {
      final refreshToken = await localStorageService.getRefreshToken();

      if (refreshToken == null) {
        _refreshCompleter!.complete(null);
        _isRefreshing = false;
        return null;
      }

      final dio = Dio(BaseOptions(
        baseUrl: "",
        headers: {
          'accept': 'application/json',
        },
      ));

      final response = await dio.post(
        '/auth/refresh_token',
        data: {
          'refreshToken': refreshToken,
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data as List;
        if (responseData.isNotEmpty) {
          final tokenData = responseData[0];
          final newAccessToken = tokenData['accessToken'] as String;
          // final newRefreshToken = tokenData['refresh_token'] as String;

          // First delete old tokens before saving new ones
          await localStorageService.deleteAccessToken();
          await localStorageService.deleteRefreshToken();

          // Then save new tokens
          await localStorageService.setAccessToken(newAccessToken);
          // await localStorageService.setRefreshToken(newRefreshToken);

          _refreshCompleter!.complete(newAccessToken);
          _isRefreshing = false;
          return newAccessToken;
        }
      }

      // If refresh fails or response format is unexpected, clear tokens
      await localStorageService.clearAuthData();
      _refreshCompleter!.complete(null);
      _isRefreshing = false;
      return null;
    } catch (e) {
      log('Error refreshing token: $e');
      await localStorageService.clearAuthData();
      _refreshCompleter!.complete(null);
      _isRefreshing = false;
      return null;
    }
  }
}