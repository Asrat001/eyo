import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:eyo_bingo/core/service/token_refreshing_service.dart';
import '../../di.dart';
import 'local_storage_service.dart';


class TokenInterceptor extends Interceptor {
  final bool requireAuth;
  final Dio dio;


  TokenInterceptor({required this.requireAuth, required this.dio});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final String? accessToken = await sl<LocalStorageService>().getAccessToken();
    if (requireAuth && accessToken != null) {
      options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Check if error is due to an expired token (401 Unauthorized)
    if (err.response?.statusCode == 401 && requireAuth) {
      log('Token expired, attempting to refresh...');

      // Store the original request to retry it later
      final options = err.requestOptions;

      try {
        // Attempt to refresh the token
        final newToken = await sl<TokenRefreshService>().refreshToken();

        if (newToken != null) {
          log('Token refreshed successfully, retrying original request');

          // Update the authorization header with the new token
          options.headers['Authorization'] = 'Bearer $newToken';

          // Retry the original request with the updated token
          final response = await dio.fetch(options);

          // Return the successful response from the retried request
          handler.resolve(response);
          return;
        } else {
          log('Failed to refresh token, logging out');
          // Token refresh failed, proceed with logout
          _handleLogout();
        }
      } catch (e) {
        log('Error during token refresh: $e');
        // Error during refresh, proceed with logout
        _handleLogout();
      }
    }

    // For other errors, just pass them through
    return handler.next(err);
  }

  void _handleLogout() {
    // Clear tokens
    sl<LocalStorageService>().clearAuthData();
    // final context = NavigationService.currentContext;
    // if (context != null) {
    //   // Show error message
    //   AppHelpers.showCheckFlash(
    //     context,
    //     'Session expired. Please login again.',
    //   );

      // // Navigate to login
      // context.goNamed(RouteName.login);

  }
}
