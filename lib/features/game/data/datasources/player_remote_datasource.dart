import 'package:logger/logger.dart';
import '../../../../core/data/models/player_model.dart';
import '../../../../core/models/api_response.dart';
import '../../../../core/service/dio_service.dart';
import '../../../../core/utils/network_exceptions_utils.dart';

/// Remote datasource for player data using API
class PlayerRemoteDataSource {
  final DioHttpClient _dioClient;
  final Logger _logger = Logger();

  PlayerRemoteDataSource(this._dioClient);

  /// Get player by ID
  Future<ApiResponse<PlayerModel>> getPlayer(String playerId) async {
    try {
      final response = await _dioClient.client(requireAuth: true).get(
        '/players/$playerId',
      );

      final player = PlayerModel.fromJson(response.data['data']);
      return ApiResponse.success(data: player);
    } catch (e) {
      _logger.e('Failed to get player', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Get current user's player profile
  Future<ApiResponse<PlayerModel>> getCurrentPlayer() async {
    try {
      final response = await _dioClient.client(requireAuth: true).get(
        '/players/me',
      );

      final player = PlayerModel.fromJson(response.data['data']);
      return ApiResponse.success(data: player);
    } catch (e) {
      _logger.e('Failed to get current player', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Update player profile
  Future<ApiResponse<PlayerModel>> updatePlayer(PlayerModel player) async {
    try {
      final response = await _dioClient.client(requireAuth: true).put(
        '/players/${player.id}',
        data: player.toJson(),
      );

      final updatedPlayer = PlayerModel.fromJson(response.data['data']);
      _logger.i('Player updated: ${updatedPlayer.id}');
      return ApiResponse.success(data: updatedPlayer);
    } catch (e) {
      _logger.e('Failed to update player', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Get leaderboard
  Future<ApiResponse<List<PlayerModel>>> getLeaderboard({int limit = 50}) async {
    try {
      final response = await _dioClient.client(requireAuth: true).get(
        '/players/leaderboard',
        queryParameters: {'limit': limit},
      );

      final players = (response.data['data'] as List)
          .map((json) => PlayerModel.fromJson(json))
          .toList();

      _logger.i('Retrieved ${players.length} players for leaderboard');
      return ApiResponse.success(data: players);
    } catch (e) {
      _logger.e('Failed to get leaderboard', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Update player stats after game
  Future<ApiResponse<PlayerModel>> updatePlayerStats({
    required String playerId,
    required bool won,
    required int prizeAmount,
  }) async {
    try {
      final response = await _dioClient.client(requireAuth: true).post(
        '/players/$playerId/stats',
        data: {
          'won': won,
          'prizeAmount': prizeAmount,
        },
      );

      final player = PlayerModel.fromJson(response.data['data']);
      _logger.i('Player stats updated: $playerId');
      return ApiResponse.success(data: player);
    } catch (e) {
      _logger.e('Failed to update player stats', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
