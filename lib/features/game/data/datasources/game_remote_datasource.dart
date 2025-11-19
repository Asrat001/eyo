import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../../../../core/data/models/game_model.dart';
import '../../../../core/models/api_response.dart';
import '../../../../core/service/dio_service.dart';
import '../../../../core/utils/network_exceptions_utils.dart';

/// Remote datasource for game data using API
class GameRemoteDataSource {
  final DioHttpClient _dioClient;
  final Logger _logger = Logger();

  GameRemoteDataSource(this._dioClient);

  /// Create a new game on the server
  Future<ApiResponse<GameModel>> createGame({
    required String hostId,
    required int maxPlayers,
    required int entryFee,
    required String winPattern,
    required int numberCallInterval,
  }) async {
    try {
      final response = await _dioClient.client(requireAuth: true).post(
        '/games/create',
        data: {
          'hostId': hostId,
          'maxPlayers': maxPlayers,
          'entryFee': entryFee,
          'winPattern': winPattern,
          'numberCallInterval': numberCallInterval,
        },
      );

      final game = GameModel.fromJson(response.data['data']);
      _logger.i('Game created: ${game.id}');
      return ApiResponse.success(data: game);
    } catch (e) {
      _logger.e('Failed to create game', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Join a game by PIN
  Future<ApiResponse<GameModel>> joinGame(String pin, String playerId) async {
    try {
      final response = await _dioClient.client(requireAuth: true).post(
        '/games/join',
        data: {
          'pin': pin,
          'playerId': playerId,
        },
      );

      final game = GameModel.fromJson(response.data['data']);
      _logger.i('Joined game: ${game.id}');
      return ApiResponse.success(data: game);
    } catch (e) {
      _logger.e('Failed to join game', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Leave a game
  Future<ApiResponse<void>> leaveGame(String gameId, String playerId) async {
    try {
      await _dioClient.client(requireAuth: true).post(
        '/games/$gameId/leave',
        data: {'playerId': playerId},
      );

      _logger.i('Left game: $gameId');
      return const ApiResponse.success(data: null);
    } catch (e) {
      _logger.e('Failed to leave game', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Get game by ID
  Future<ApiResponse<GameModel>> getGame(String gameId) async {
    try {
      final response = await _dioClient.client(requireAuth: true).get(
        '/games/$gameId',
      );

      final game = GameModel.fromJson(response.data['data']);
      return ApiResponse.success(data: game);
    } catch (e) {
      _logger.e('Failed to get game', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Get game by PIN
  Future<ApiResponse<GameModel>> getGameByPin(String pin) async {
    try {
      final response = await _dioClient.client(requireAuth: true).get(
        '/games/pin/$pin',
      );

      final game = GameModel.fromJson(response.data['data']);
      return ApiResponse.success(data: game);
    } catch (e) {
      _logger.e('Failed to get game by PIN', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Get active games
  Future<ApiResponse<List<GameModel>>> getActiveGames() async {
    try {
      final response = await _dioClient.client(requireAuth: true).get(
        '/games/active',
      );

      final games = (response.data['data'] as List)
          .map((json) => GameModel.fromJson(json))
          .toList();

      _logger.i('Retrieved ${games.length} active games');
      return ApiResponse.success(data: games);
    } catch (e) {
      _logger.e('Failed to get active games', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Get player's game history
  Future<ApiResponse<List<GameModel>>> getPlayerGameHistory(String playerId) async {
    try {
      final response = await _dioClient.client(requireAuth: true).get(
        '/games/history/$playerId',
      );

      final games = (response.data['data'] as List)
          .map((json) => GameModel.fromJson(json))
          .toList();

      _logger.i('Retrieved ${games.length} games for player $playerId');
      return ApiResponse.success(data: games);
    } catch (e) {
      _logger.e('Failed to get player game history', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
