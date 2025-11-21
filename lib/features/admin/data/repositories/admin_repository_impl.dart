import '../../../../core/data/models/bingo/user_model.dart';
import '../../../../core/models/api_response.dart';
import '../../domain/repositories/admin_repository.dart';
import '../datasources/admin_remote_datasource.dart';

/// Admin repository implementation
class AdminRepositoryImpl implements AdminRepository {
  final AdminRemoteDataSource _remoteDataSource;

  AdminRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<List<UserModel>>> getPlayers() async {
    return await _remoteDataSource.getPlayers();
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> addToPlayerWallet(
    String playerId,
    double amount,
  ) async {
    return await _remoteDataSource.addToPlayerWallet(playerId, amount);
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> subtractFromPlayerWallet(
    String playerId,
    double amount,
  ) async {
    return await _remoteDataSource.subtractFromPlayerWallet(playerId, amount);
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> setPlayerWallet(
    String playerId,
    double amount,
  ) async {
    return await _remoteDataSource.setPlayerWallet(playerId, amount);
  }

  @override
  Future<ApiResponse<List<UserModel>>> getAdmins() async {
    return await _remoteDataSource.getAdmins();
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> addCreditsToAdmin(
    String adminId,
    int credits,
  ) async {
    return await _remoteDataSource.addCreditsToAdmin(adminId, credits);
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> subtractCreditsFromAdmin(
    String adminId,
    int credits,
  ) async {
    return await _remoteDataSource.subtractCreditsFromAdmin(adminId, credits);
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> setAdminCredits(
    String adminId,
    int credits,
  ) async {
    return await _remoteDataSource.setAdminCredits(adminId, credits);
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> setGameCost(
    String adminId,
    String gameType,
    int cost,
  ) async {
    return await _remoteDataSource.setGameCost(adminId, gameType, cost);
  }
}
