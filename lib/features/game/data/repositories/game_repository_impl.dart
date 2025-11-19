import 'package:eyo_bingo/core/data/models/game_model.dart';
import 'package:logger/logger.dart';
import '../../../../core/domain/entities/game.dart';
import '../../../../core/domain/entities/bingo_card.dart';
import '../../../../core/models/api_response.dart';
import '../../domain/repositories/game_repository.dart';
import '../datasources/game_local_datasource.dart';
import '../datasources/game_remote_datasource.dart';

/// Implementation of GameRepository
/// Coordinates between local and remote datasources
class GameRepositoryImpl implements GameRepository {
  final GameLocalDataSource _localDataSource;
  final GameRemoteDataSource _remoteDataSource;
  final Logger _logger = Logger();

  GameRepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  Future<Game> createGame({
    required String hostId,
    required int maxPlayers,
    required int entryFee,
    required WinPattern winPattern,
    required int numberCallInterval,
  }) async {
    final response = await _remoteDataSource.createGame(
      hostId: hostId,
      maxPlayers: maxPlayers,
      entryFee: entryFee,
      winPattern: winPattern.name,
      numberCallInterval: numberCallInterval,
    );

    return response.when(
      success: (gameModel) async {
        final game = gameModel.toEntity();
        // Save locally for offline access
        await _localDataSource.saveGame(gameModel);
        return game;
      },
      failure: (error) {
        _logger.e('Failed to create game: $error');
        throw Exception('Failed to create game: ${error.toString()}');
      },
    );
  }

  @override
  Future<Game> joinGame(String pin, String playerId) async {
    final response = await _remoteDataSource.joinGame(pin, playerId);

    return response.when(
      success: (gameModel) async {
        final game = gameModel.toEntity();
        await _localDataSource.saveGame(gameModel);
        return game;
      },
      failure: (error) {
        _logger.e('Failed to join game: $error');
        throw Exception('Failed to join game: ${error.toString()}');
      },
    );
  }

  @override
  Future<void> leaveGame(String gameId, String playerId) async {
    final response = await _remoteDataSource.leaveGame(gameId, playerId);
     response.when(
      success: (_) async {
        // Optionally remove from local storage
        await _localDataSource.deleteGame(gameId);
      },
      failure: (error) {
        _logger.e('Failed to leave game: $error');
        throw Exception('Failed to leave game: ${error.toString()}');
      },
    );
  }

  @override
  Future<Game?> getGame(String gameId) async {
    // Try remote first
    final response = await _remoteDataSource.getGame(gameId);

    return response.when(
      success: (gameModel) async {
        final game = gameModel.toEntity();
        await _localDataSource.saveGame(gameModel);
        return game;
      },
      failure: (error) async {
        // Fallback to local
        _logger.w('Remote fetch failed, trying local: $error');
        final localGame = await _localDataSource.getGame(gameId);
        return localGame?.toEntity();
      },
    );
  }

  @override
  Future<Game?> getGameByPin(String pin) async {
    final response = await _remoteDataSource.getGameByPin(pin);

    return response.when(
      success: (gameModel) async {
        final game = gameModel.toEntity();
        await _localDataSource.saveGame(gameModel);
        return game;
      },
      failure: (error) {
        _logger.e('Failed to get game by PIN: $error');
        return null;
      },
    );
  }

  @override
  Future<Game> startGame(String gameId) async {
    // This would be handled by server/Socket.IO
    // For now, just fetch the updated game
    final game = await getGame(gameId);
    if (game == null) {
      throw Exception('Game not found');
    }
    return game;
  }

  @override
  Future<Game> callNumber(String gameId, int number) async {
    // This would be handled by server/Socket.IO
    // For now, just fetch the updated game
    final game = await getGame(gameId);
    if (game == null) {
      throw Exception('Game not found');
    }
    return game;
  }

  @override
  Future<Game> claimBingo(String gameId, String playerId) async {
    // This would be handled by server/Socket.IO
    // For now, just fetch the updated game
    final game = await getGame(gameId);
    if (game == null) {
      throw Exception('Game not found');
    }
    return game;
  }

  @override
  Future<Game> endGame(String gameId, String winnerId) async {
    // This would be handled by server/Socket.IO
    final game = await getGame(gameId);
    if (game == null) {
      throw Exception('Game not found');
    }
    return game;
  }

  @override
  Future<List<Game>> getActiveGames() async {
    final response = await _remoteDataSource.getActiveGames();

    return response.when(
      success: (gameModels) async {
        // Save all games locally
        for (var model in gameModels) {
          await _localDataSource.saveGame(model);
        }
        return gameModels.map((m) => m.toEntity()).toList();
      },
      failure: (error) async {
        // Fallback to local
        _logger.w('Remote fetch failed, trying local: $error');
        final localGames = await _localDataSource.getGamesByStatus('inProgress');
        return localGames.map((m) => m.toEntity()).toList();
      },
    );
  }

  @override
  Future<List<Game>> getPlayerGameHistory(String playerId) async {
    final response = await _remoteDataSource.getPlayerGameHistory(playerId);

    return response.when(
      success: (gameModels) {
        return gameModels.map((m) => m.toEntity()).toList();
      },
      failure: (error) {
        _logger.e('Failed to get player game history: $error');
        return [];
      },
    );
  }

  @override
  Future<void> saveGameLocally(Game game) async {
    final model = game.toModel();
    await _localDataSource.saveGame(model);
  }

  @override
  Future<Game?> getLocalGame(String gameId) async {
    final model = await _localDataSource.getGame(gameId);
    return model?.toEntity();
  }

  @override
  Future<void> syncGames() async {
    // Get all local games and sync with server
    final localGames = await _localDataSource.getAllGames();
    _logger.i('Syncing ${localGames.length} games with server');
    // TODO: Implement sync logic
  }
}

// Extension to convert Game entity to GameModel
extension on Game {
  toModel() {
    return GameModel.fromEntity(this);
  }
}
