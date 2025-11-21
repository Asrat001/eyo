import 'package:logger/logger.dart';
import '../../../../core/data/models/bingo/bingo_game_model.dart';
import '../../../../core/models/api_response.dart';
import '../../../../core/service/dio_service.dart';
import '../../../../core/utils/network_exceptions_utils.dart';

/// Remote datasource for Number Bingo game data
class NumberBingoRemoteDataSource {
  final DioHttpClient _dioClient;
  final Logger _logger = Logger();

  NumberBingoRemoteDataSource(this._dioClient);

  /// Get all available games
  Future<ApiResponse<List<BingoGameModel>>> getGames() async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .get('/bingo/games');

      final games = (response.data as List)
          .map((json) => BingoGameModel.fromJson(json))
          .toList();

      _logger.i('Retrieved ${games.length} bingo games');
      return ApiResponse.success(data: games);
    } catch (e) {
      _logger.e('Failed to get games', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Get game details
  Future<ApiResponse<Map<String, dynamic>>> getGameDetails(
    String gameId,
  ) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .get('/bingo/games/$gameId');

      _logger.i('Retrieved game details for: $gameId');
      _logger.i('Retrieved game details for: ${response.data}');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to get game details', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Join a game
  Future<ApiResponse<Map<String, dynamic>>> joinGame(
    String gameId,
    String pin,
  ) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .post('/bingo/games/$gameId/join', data: {'pin': pin});

      _logger.i('Joined game: $gameId');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to join game', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Select a card
  Future<ApiResponse<Map<String, dynamic>>> selectCard(
    String gameId,
    int cardNumber,
  ) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .post(
            '/bingo/games/$gameId/select-card',
            data: {'cardNumber': cardNumber},
          );

      _logger.i('Selected card $cardNumber for game: $gameId');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to select card', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Mark a number (manual mode)
  Future<ApiResponse<Map<String, dynamic>>> markNumber(
    String gameId,
    int number,
  ) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .post('/bingo/games/$gameId/mark-number', data: {'number': number});

      _logger.i('Marked number $number for game: $gameId');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to mark number', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Get game history
  Future<ApiResponse<List<dynamic>>> getGameHistory() async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .get('/bingo/history');

      _logger.i('Retrieved game history');
      return ApiResponse.success(data: response.data as List);
    } catch (e) {
      _logger.e('Failed to get game history', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  // ============= ADMIN ENDPOINTS =============

  /// Create a new game (admin only)
  Future<ApiResponse<Map<String, dynamic>>> createGame({
    required int maxPlayers,
    String winningPattern = 'any-line',
    int autoCallInterval = 3000,
    String markingMode = 'auto',
    double playerEntryFee = 10,
    int profitPercentage = 10,
  }) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .post(
            '/bingo/create',
            data: {
              'maxPlayers': maxPlayers,
              'winningPattern': winningPattern,
              'autoCallInterval': autoCallInterval,
              'markingMode': markingMode,
              'playerEntryFee': playerEntryFee,
              'profitPercentage': profitPercentage,
            },
          );

      _logger.i('Created bingo game');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to create game', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Prepare game (admin only)
  Future<ApiResponse<Map<String, dynamic>>> prepareGame(String gameId) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .post('/bingo/games/$gameId/prepare');

      _logger.i('Prepared game: $gameId');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to prepare game', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Start game (admin only)
  Future<ApiResponse<Map<String, dynamic>>> startGame(String gameId) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .post('/bingo/games/$gameId/start');

      _logger.i('Started game: $gameId');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to start game', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Pause game (admin only)
  Future<ApiResponse<Map<String, dynamic>>> pauseGame(String gameId) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .post('/bingo/games/$gameId/pause');

      _logger.i('Paused game: $gameId');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to pause game', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Resume game (admin only)
  Future<ApiResponse<Map<String, dynamic>>> resumeGame(String gameId) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .post('/bingo/games/$gameId/resume');

      _logger.i('Resumed game: $gameId');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to resume game', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Stop game (admin only)
  Future<ApiResponse<Map<String, dynamic>>> stopGame(String gameId) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .post('/bingo/games/$gameId/stop');

      _logger.i('Stopped game: $gameId');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to stop game', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// Manually call number (admin only)
  Future<ApiResponse<Map<String, dynamic>>> callNumber(String gameId) async {
    try {
      final response = await _dioClient
          .client(requireAuth: true)
          .post('/bingo/games/$gameId/call-number');

      _logger.i('Called number for game: $gameId');
      return ApiResponse.success(data: response.data);
    } catch (e) {
      _logger.e('Failed to call number', error: e);
      return ApiResponse.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
