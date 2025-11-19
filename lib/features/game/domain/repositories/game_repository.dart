import '../../../data/models/game_model.dart';
import '../../entities/game.dart';

/// Repository interface for game operations
/// Follows clean architecture - implementation will be in data layer
abstract class GameRepository {
  /// Create a new game
  Future<Game> createGame({
    required String hostId,
    required int maxPlayers,
    required int entryFee,
    required WinPattern winPattern,
    required int numberCallInterval,
  });

  /// Join an existing game by PIN
  Future<Game> joinGame(String pin, String playerId);

  /// Leave a game
  Future<void> leaveGame(String gameId, String playerId);

  /// Get game by ID
  Future<Game?> getGame(String gameId);

  /// Get game by PIN
  Future<Game?> getGameByPin(String pin);

  /// Start a game
  Future<Game> startGame(String gameId);

  /// Call a number in the game
  Future<Game> callNumber(String gameId, int number);

  /// Claim bingo win
  Future<Game> claimBingo(String gameId, String playerId);

  /// End a game
  Future<Game> endGame(String gameId, String winnerId);

  /// Get active games (waiting or in progress)
  Future<List<Game>> getActiveGames();

  /// Get player's game history
  Future<List<Game>> getPlayerGameHistory(String playerId);

  /// Save game locally (for offline access)
  Future<void> saveGameLocally(Game game);

  /// Get locally saved game
  Future<Game?> getLocalGame(String gameId);

  /// Sync local games with server
  Future<void> syncGames();
}
