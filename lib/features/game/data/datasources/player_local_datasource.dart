import 'package:logger/logger.dart';
import '../../../../core/data/models/player_model.dart';
import '../../../../core/service/hive_service.dart';
import '../../../../core/utils/hive_box_names.dart';

/// Local datasource for player data using Hive
class PlayerLocalDataSource {
  final HiveService _hiveService;
  final Logger _logger = Logger();

  PlayerLocalDataSource(this._hiveService);

  /// Save a player to local storage
  Future<void> savePlayer(PlayerModel player) async {
    try {
      final box = await _hiveService.openBox<Map>(HiveBoxNames.players);
      await box.put(player.id, player.toJson());
      _logger.i('Player saved locally: ${player.id}');
    } catch (e, stackTrace) {
      _logger.e('Failed to save player locally', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Get a player from local storage
  Future<PlayerModel?> getPlayer(String playerId) async {
    try {
      final box = await _hiveService.openBox<Map>(HiveBoxNames.players);
      final data = box.get(playerId);
      
      if (data == null) {
        _logger.w('Player not found locally: $playerId');
        return null;
      }

      return PlayerModel.fromJson(Map<String, dynamic>.from(data));
    } catch (e, stackTrace) {
      _logger.e('Failed to get player locally', error: e, stackTrace: stackTrace);
      return null;
    }
  }

  /// Get all players from local storage
  Future<List<PlayerModel>> getAllPlayers() async {
    try {
      final box = await _hiveService.openBox<Map>(HiveBoxNames.players);
      final players = <PlayerModel>[];

      for (var data in box.values) {
        try {
          players.add(PlayerModel.fromJson(Map<String, dynamic>.from(data)));
        } catch (e) {
          _logger.w('Failed to parse player from local storage', error: e);
        }
      }

      _logger.i('Retrieved ${players.length} players from local storage');
      return players;
    } catch (e, stackTrace) {
      _logger.e('Failed to get all players locally', error: e, stackTrace: stackTrace);
      return [];
    }
  }

  /// Delete a player from local storage
  Future<void> deletePlayer(String playerId) async {
    try {
      final box = await _hiveService.openBox<Map>(HiveBoxNames.players);
      await box.delete(playerId);
      _logger.i('Player deleted locally: $playerId');
    } catch (e, stackTrace) {
      _logger.e('Failed to delete player locally', error: e, stackTrace: stackTrace);
    }
  }

  /// Clear all players from local storage
  Future<void> clearAllPlayers() async {
    try {
      await _hiveService.clearBox(HiveBoxNames.players);
      _logger.i('All players cleared from local storage');
    } catch (e, stackTrace) {
      _logger.e('Failed to clear players', error: e, stackTrace: stackTrace);
    }
  }
}
