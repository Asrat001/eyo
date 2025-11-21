import '../../../../core/data/models/bingo/auth_response_model.dart';
import '../../../../core/data/models/bingo/user_model.dart';
import '../../../../core/models/api_response.dart';

/// Auth repository interface
abstract class AuthRepository {
  Future<ApiResponse<UserModel>> login(String username, String password);
  Future<ApiResponse<UserModel>> register(String username, String password);
  Future<ApiResponse<UserModel>> getCurrentUser();
  Future<void> logout();
  Future<bool> isLoggedIn();
  Future<ApiResponse<Map<String, dynamic>>> getWalletHistory({int limit = 50});
}
