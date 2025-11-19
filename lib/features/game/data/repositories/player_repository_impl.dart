import 'package:logger/logger.dart';
import '../../../../core/domain/entities/player.dart';
import '../../domain/repositories/player_repository.dart';
import '../datasources/player_local_datasource.dart';
import '../datasources/player_remote_datasource.dart';
import '../../../../core/data/models/player_model.dart';

/// Implementation of PlayerRepository
class PlayerRepositoryImpl implements PlayerRepository {
  final PlayerLocalDataSource _localDataSource;
  final PlayerRemoteDataSource _remoteDataSource;
  final Logger _logger = Logger();

  PlayerRepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  Future<Player?> getPlayer(String playerId) async {
    final response = await _remoteDataSource.getPlayer(playerId);

    return response.when(
      success: (playerModel) async {
        final player = playerModel.toEntity();
        await _localDataSource.savePlayer(playerModel);
        return player;
      },
      failure: (error) async {
        // Fallback to local
        _logger.w('Remote fetch failed, trying local: $error');
        final localPlayer = await _localDataSource.getPlayer(playerId);
        return localPlayer?.toEntity();
      },
    );
  }

  @override
  Future<Player?> getCurrentPlayer() async {
    final response = await _remoteDataSource.getCurrentPlayer();

    return response.when(
      success: (playerModel) async {
        final player = playerModel.toEntity();
        await _localDataSource.savePlayer(playerModel);
        return player;
      },
      failure: (error) {
        _logger.e('Failed to get current player: $error');
        return null;
      },
    );
  }

  @override
  Future<Player> updatePlayer(Player player) async {
    final model = PlayerModel.fromEntity(player);
    final response = await _remoteDataSource.updatePlayer(model);

    return response.when(
      success: (playerModel) async {
        final updatedPlayer = playerModel.toEntity();
        await _localDataSource.savePlayer(playerModel);
        return updatedPlayer;
      },
      failure: (error) {
        _logger.e('Failed to update player: $error');
        throw Exception('Failed to update player: ${error.toString()}');
      },
    );
  }

  @override
  Future<List<Player>> getLeaderboard({int limit = 50}) async {
    final response = await _remoteDataSource.getLeaderboard(limit: limit);

    return response.when(
      success: (playerModels) {
        return playerModels.map((m) => m.toEntity()).toList();
      },
      failure: (error) async {
        // Fallback to local cached leaderboard
        _logger.w('Remote fetch failed, trying local: $error');
        final localPlayers = await _localDataSource.getAllPlayers();
        // Sort by wins
        localPlayers.sort((a, b) => b.totalWins.compareTo(a.totalWins));
        return localPlayers.take(limit).map((m) => m.toEntity()).toList();
      },
    );
  }

  @override
  Future<void> savePlayerLocally(Player player) async {
    final model = PlayerModel.fromEntity(player);
    await _localDataSource.savePlayer(model);
  }

  @override
  Future<Player?> getLocalPlayer(String playerId) async {
    final model = await _localDataSource.getPlayer(playerId);
    return model?.toEntity();
  }

  @override
  Future<Player> updatePlayerStats({
    required String playerId,
    required bool won,
    required int prizeAmount,
  }) async {
    final response = await _remoteDataSource.updatePlayerStats(
      playerId: playerId,
      won: won,
      prizeAmount: prizeAmount,
    );

    return response.when(
      success: (playerModel) async {
        final player = playerModel.toEntity();
        await _localDataSource.savePlayer(playerModel);
        return player;
      },
      failure: (error) {
        _logger.e('Failed to update player stats: $error');
        throw Exception('Failed to update player stats: ${error.toString()}');
      },
    );
  }
}
