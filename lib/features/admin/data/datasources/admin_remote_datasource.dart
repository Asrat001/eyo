import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../../../../core/data/models/bingo/user_model.dart';
import '../../../../core/models/api_response.dart';
import '../../../../core/service/dio_service.dart';
import '../../../../core/utils/network_exceptions_utils.dart';

/// Remote datasource for admin management
class AdminRemoteDataSource {
  final DioHttpClient _dioClient;
  final Logger _logger = Logger();

  AdminRemoteDataSource(this._dioClient);

  // ============= PLAYER WALLET MANAGEMENT =============

  /// Get all players (admin only)
  Future<ApiResponse<List<UserModel>>> getPlayers() async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .get('/admin-management/players');

      final players = (response.data as List)
          .map((json) => UserModel.fromJson(json))
          .toList();

      _logger.i('Retrieved ${players.length} players');
      return ApiResponse.success(data: players);
    } catch (e) {
      _logger.e('Failed to get players', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Add to player wallet
  Future<ApiResponse<Map<String, dynamic>>> addToPlayerWallet(
    String playerId,
    double amount,
  ) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .post(
            '/admin-management/player-wallet/add',
            data: {'playerId': playerId, 'amount': amount},
          );

      _logger.i('Added $amount to player wallet: $playerId');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to add to player wallet', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Subtract from player wallet
  Future<ApiResponse<Map<String, dynamic>>> subtractFromPlayerWallet(
    String playerId,
    double amount,
  ) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .post(
            '/admin-management/player-wallet/subtract',
            data: {'playerId': playerId, 'amount': amount},
          );

      _logger.i('Subtracted $amount from player wallet: $playerId');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to subtract from player wallet', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Set player wallet
  Future<ApiResponse<Map<String, dynamic>>> setPlayerWallet(
    String playerId,
    double amount,
  ) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .post(
            '/admin-management/player-wallet/set',
            data: {'playerId': playerId, 'amount': amount},
          );

      _logger.i('Set player wallet to $amount: $playerId');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to set player wallet', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  // ============= SUPER ADMIN ENDPOINTS =============

  /// Get all admins (super admin only)
  Future<ApiResponse<List<UserModel>>> getAdmins() async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .get('/admin-management/admins');

      final admins = (response.data as List)
          .map((json) => UserModel.fromJson(json))
          .toList();

      _logger.i('Retrieved ${admins.length} admins');
      return ApiResponse.success(data: admins);
    } catch (e) {
      _logger.e('Failed to get admins', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Add credits to admin
  Future<ApiResponse<Map<String, dynamic>>> addCreditsToAdmin(
    String adminId,
    int credits,
  ) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .post(
            '/admin-management/admin-credits/add',
            data: {'adminId': adminId, 'credits': credits},
          );

      _logger.i('Added $credits credits to admin: $adminId');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to add credits to admin', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Subtract credits from admin
  Future<ApiResponse<Map<String, dynamic>>> subtractCreditsFromAdmin(
    String adminId,
    int credits,
  ) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .post(
            '/admin-management/admin-credits/subtract',
            data: {'adminId': adminId, 'credits': credits},
          );

      _logger.i('Subtracted $credits credits from admin: $adminId');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to subtract credits from admin', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Set admin credits
  Future<ApiResponse<Map<String, dynamic>>> setAdminCredits(
    String adminId,
    int credits,
  ) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .post(
            '/admin-management/admin-credits/set',
            data: {'adminId': adminId, 'credits': credits},
          );

      _logger.i('Set admin credits to $credits: $adminId');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to set admin credits', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Set game cost for admin
  Future<ApiResponse<Map<String, dynamic>>> setGameCost(
    String adminId,
    String gameType,
    int cost,
  ) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .post(
            '/admin-management/game-cost',
            data: {'adminId': adminId, 'gameType': gameType, 'cost': cost},
          );

      _logger.i('Set game cost for $gameType to $cost: $adminId');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to set game cost', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
