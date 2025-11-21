import '../../../../core/data/models/bingo/user_model.dart';
import '../../../../core/models/api_response.dart';
import '../../../../core/service/local_storage_service.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

/// Auth repository implementation
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final LocalStorageService _localStorage;

  AuthRepositoryImpl(this._remoteDataSource, this._localStorage);

  @override
  Future<ApiResponse<UserModel>> login(String username, String password) async {
    final result = await _remoteDataSource.login(username, password);

    return result.when(
      success: (authResponse) async {
        // Save token and user data
        await _localStorage.setAccessToken(authResponse.token);
        await _localStorage.setUserData(authResponse.user);
        return ApiResponse.success(data: authResponse.user);
      },
      failure: (error) {
        return ApiResponse.failure(error: error);
      },
    );
  }

  @override
  Future<ApiResponse<UserModel>> register(
    String username,
    String password,
  ) async {
    final result = await _remoteDataSource.register(username, password);

    return result.when(
      success: (authResponse) async {
        // Save token and user data
        await _localStorage.setAccessToken(authResponse.token);
        await _localStorage.setUserData(authResponse.user);
        return ApiResponse.success(data: authResponse.user);
      },
      failure: (error) {
        return ApiResponse.failure(error: error);
      },
    );
  }

  @override
  Future<ApiResponse<UserModel>> getCurrentUser() async {
    return await _remoteDataSource.getCurrentUser();
  }

  @override
  Future<void> logout() async {
    await _localStorage.clearAuthData();
    await _localStorage.deleteUserData();
  }

  @override
  Future<bool> isLoggedIn() async {
    final token = await _localStorage.getAccessToken();
    return token != null && token.isNotEmpty;
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> getWalletHistory({
    int limit = 50,
  }) async {
    return await _remoteDataSource.getWalletHistory(limit: limit);
  }
}
