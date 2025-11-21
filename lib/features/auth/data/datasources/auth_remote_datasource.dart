
import 'package:logger/logger.dart';
import '../../../../core/data/models/bingo/auth_response_model.dart';
import '../../../../core/data/models/bingo/user_model.dart';
import '../../../../core/models/api_response.dart';
import '../../../../core/service/dio_service.dart';
import '../../../../core/utils/network_exceptions_utils.dart';

/// Remote datasource for authentication
class AuthRemoteDataSource {
  final DioHttpClient _dioClient;
  final Logger _logger = Logger();

  AuthRemoteDataSource(this._dioClient);

  /// Register new user
  Future<ApiResponse<AuthResponseModel>> register(
    String username,
    String password,
  ) async {
    try {
      final response = await _dioClient
          .client(requireAuth: false)
          .post(
            '/auth/register',
            data: {'username': username, 'password': password},
          );

      final authResponse = AuthResponseModel.fromJson(response.data);
      _logger.i('User registered: ${authResponse.user.username}');
      return ApiResponse.success(data: authResponse);
    } catch (e) {
      _logger.e('Failed to register', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Login user
  Future<ApiResponse<AuthResponseModel>> login(
    String username,
    String password,
  ) async {
    try {
      final response = await _dioClient
          .client(requireAuth: false)
          .post(
            '/auth/login',
            data: {'username': username, 'password': password},
          );

      final authResponse = AuthResponseModel.fromJson(response.data);
      _logger.i('User logged in: ${authResponse.user.username}');
      return ApiResponse.success(data: authResponse);
    } catch (e) {
      _logger.e('Failed to login', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Get current user
  Future<ApiResponse<UserModel>> getCurrentUser() async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .get('/auth/me');

      final user = UserModel.fromJson(response.data);
      _logger.i('Fetched current user: ${user.username}');
      return ApiResponse.success(data: user);
    } catch (e) {
      _logger.e('Failed to get current user', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Get wallet history
  Future<ApiResponse<Map<String, dynamic>>> getWalletHistory({
    int limit = 50,
  }) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .get('/auth/my-wallet-history', queryParameters: {'limit': limit});

      _logger.i('Fetched wallet history');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to get wallet history', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
