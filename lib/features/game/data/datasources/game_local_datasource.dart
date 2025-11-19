import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import '../../../../core/data/models/game_model.dart';
import '../../../../core/service/hive_service.dart';
import '../../../../core/utils/hive_box_names.dart';

/// Local datasource for game data using Hive
class GameLocalDataSource {
  final HiveService _hiveService;
  final Logger _logger = Logger();

  GameLocalDataSource(this._hiveService);

  /// Save a game to local storage
  Future<void> saveGame(GameModel game) async {
    try {
      final box = await _hiveService.openBox<Map>(HiveBoxNames.games);
      await box.put(game.id, game.toJson());
      _logger.i('Game saved locally: ${game.id}');
    } catch (e, stackTrace) {
      _logger.e('Failed to save game locally', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Get a game from local storage
  Future<GameModel?> getGame(String gameId) async {
    try {
      final box = await _hiveService.openBox<Map>(HiveBoxNames.games);
      final data = box.get(gameId);
      
      if (data == null) {
        _logger.w('Game not found locally: $gameId');
        return null;
      }

      return GameModel.fromJson(Map<String, dynamic>.from(data));
    } catch (e, stackTrace) {
      _logger.e('Failed to get game locally', error: e, stackTrace: stackTrace);
      return null;
    }
  }

  /// Get all games from local storage
  Future<List<GameModel>> getAllGames() async {
    try {
      final box = await _hiveService.openBox<Map>(HiveBoxNames.games);
      final games = <GameModel>[];

      for (var data in box.values) {
        try {
          games.add(GameModel.fromJson(Map<String, dynamic>.from(data)));
        } catch (e) {
          _logger.w('Failed to parse game from local storage', error: e);
        }
      }

      _logger.i('Retrieved ${games.length} games from local storage');
      return games;
    } catch (e, stackTrace) {
      _logger.e('Failed to get all games locally', error: e, stackTrace: stackTrace);
      return [];
    }
  }

  /// Delete a game from local storage
  Future<void> deleteGame(String gameId) async {
    try {
      final box = await _hiveService.openBox<Map>(HiveBoxNames.games);
      await box.delete(gameId);
      _logger.i('Game deleted locally: $gameId');
    } catch (e, stackTrace) {
      _logger.e('Failed to delete game locally', error: e, stackTrace: stackTrace);
    }
  }

  /// Clear all games from local storage
  Future<void> clearAllGames() async {
    try {
      await _hiveService.clearBox(HiveBoxNames.games);
      _logger.i('All games cleared from local storage');
    } catch (e, stackTrace) {
      _logger.e('Failed to clear games', error: e, stackTrace: stackTrace);
    }
  }

  /// Get games by status
  Future<List<GameModel>> getGamesByStatus(String status) async {
    try {
      final allGames = await getAllGames();
      return allGames.where((game) => game.status == status).toList();
    } catch (e, stackTrace) {
      _logger.e('Failed to get games by status', error: e, stackTrace: stackTrace);
      return [];
    }
  }
}
