import '../../../../core/data/models/bingo/user_model.dart';
import '../../../../core/models/api_response.dart';

/// Admin repository interface
abstract class AdminRepository {
  // Player wallet management
  Future<ApiResponse<List<UserModel>>> getPlayers();
  Future<ApiResponse<Map<String, dynamic>>> addToPlayerWallet(
    String playerId,
    double amount,
  );
  Future<ApiResponse<Map<String, dynamic>>> subtractFromPlayerWallet(
    String playerId,
    double amount,
  );
  Future<ApiResponse<Map<String, dynamic>>> setPlayerWallet(
    String playerId,
    double amount,
  );

  // Super admin endpoints
  Future<ApiResponse<List<UserModel>>> getAdmins();
  Future<ApiResponse<Map<String, dynamic>>> addCreditsToAdmin(
    String adminId,
    int credits,
  );
  Future<ApiResponse<Map<String, dynamic>>> subtractCreditsFromAdmin(
    String adminId,
    int credits,
  );
  Future<ApiResponse<Map<String, dynamic>>> setAdminCredits(
    String adminId,
    int credits,
  );
  Future<ApiResponse<Map<String, dynamic>>> setGameCost(
    String adminId,
    String gameType,
    int cost,
  );

  Future<ApiResponse<Map<String, dynamic>>> createGame({
    required int maxPlayers,
    String winningPattern = 'any-line',
    int autoCallInterval = 3000,
    String markingMode = 'auto',
    double playerEntryFee = 10,
    int profitPercentage = 10,
  });

}
