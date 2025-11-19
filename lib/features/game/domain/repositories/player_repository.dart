import '../../../../core/domain/entities/player.dart';

/// Repository interface for player operations
abstract class PlayerRepository {
  /// Get player by ID
  Future<Player?> getPlayer(String playerId);

  /// Get current user player profile
  Future<Player?> getCurrentPlayer();

  /// Update player profile
  Future<Player> updatePlayer(Player player);

  /// Get leaderboard (top players)
  Future<List<Player>> getLeaderboard({int limit = 50});

  /// Save player locally
  Future<void> savePlayerLocally(Player player);

  /// Get locally saved player
  Future<Player?> getLocalPlayer(String playerId);

  /// Update player stats after game
  Future<Player> updatePlayerStats({
    required String playerId,
    required bool won,
    required int prizeAmount,
  });
}
