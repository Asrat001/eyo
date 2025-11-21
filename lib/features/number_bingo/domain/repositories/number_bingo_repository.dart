import '../../../../core/data/models/bingo/bingo_game_model.dart';
import '../../../../core/models/api_response.dart';

/// Number Bingo repository interface
abstract class NumberBingoRepository {
  // Player endpoints
  Future<ApiResponse<List<BingoGameModel>>> getGames();
  Future<ApiResponse<Map<String, dynamic>>> getGameDetails(String gameId);
  Future<ApiResponse<Map<String, dynamic>>> joinGame(String gameId, String pin);
  Future<ApiResponse<Map<String, dynamic>>> selectCard(
    String gameId,
    int cardNumber,
  );
  Future<ApiResponse<Map<String, dynamic>>> markNumber(
    String gameId,
    int number,
  );
  Future<ApiResponse<List<dynamic>>> getGameHistory();

  // Admin endpoints
  Future<ApiResponse<Map<String, dynamic>>> createGame({
    required int maxPlayers,
    String winningPattern = 'any-line',
    int autoCallInterval = 3000,
    String markingMode = 'auto',
    double playerEntryFee = 10,
    int profitPercentage = 10,
  });
  Future<ApiResponse<Map<String, dynamic>>> prepareGame(String gameId);
  Future<ApiResponse<Map<String, dynamic>>> startGame(String gameId);
  Future<ApiResponse<Map<String, dynamic>>> pauseGame(String gameId);
  Future<ApiResponse<Map<String, dynamic>>> resumeGame(String gameId);
  Future<ApiResponse<Map<String, dynamic>>> stopGame(String gameId);
  Future<ApiResponse<Map<String, dynamic>>> callNumber(String gameId);
}
