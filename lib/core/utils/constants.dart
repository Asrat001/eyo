class LocalStorageKey {
  LocalStorageKey._();
  static const isDoneOnboarding = 'isDoneOnboarding';
  static const accessToken = 'accessToken';
  static const isDarkMode = 'isDarkMode';
  static const refreshToken = 'refreshToken';
  static const themeMode = 'themeMode';
  static const userData = 'userData';
}

/// API Configuration for Number Bingo Backend
class ApiConfig {
  ApiConfig._();

  // TODO: Update with your actual backend URL
  static const String baseUrl = 'http://194.163.158.97:2023';
  static const String apiBasePath = '/api';
  static const String socketUrl = 'http://194.163.158.97:2023';

  // Full API base URL
  static String get apiBaseUrl => '$baseUrl$apiBasePath';
}
