import '../../../../core/data/models/bingo/bingo_game_model.dart';
import '../../../../core/models/api_response.dart';
import '../../domain/repositories/number_bingo_repository.dart';
import '../datasources/number_bingo_remote_datasource.dart';

/// Number Bingo repository implementation
class NumberBingoRepositoryImpl implements NumberBingoRepository {
  final NumberBingoRemoteDataSource _remoteDataSource;

  NumberBingoRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResponse<List<BingoGameModel>>> getGames() async {
    return await _remoteDataSource.getGames();
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> getGameDetails(
    String gameId,
  ) async {
    return await _remoteDataSource.getGameDetails(gameId);
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> joinGame(
    String gameId,
    String pin,
  ) async {
    return await _remoteDataSource.joinGame(gameId, pin);
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> selectCard(
    String gameId,
    int cardNumber,
  ) async {
    return await _remoteDataSource.selectCard(gameId, cardNumber);
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> markNumber(
    String gameId,
    int number,
  ) async {
    return await _remoteDataSource.markNumber(gameId, number);
  }

  @override
  Future<ApiResponse<List<dynamic>>> getGameHistory() async {
    return await _remoteDataSource.getGameHistory();
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> createGame({
    required int maxPlayers,
    String winningPattern = 'any-line',
    int autoCallInterval = 3000,
    String markingMode = 'auto',
    double playerEntryFee = 10,
    int profitPercentage = 10,
  }) async {
    return await _remoteDataSource.createGame(
      maxPlayers: maxPlayers,
      winningPattern: winningPattern,
      autoCallInterval: autoCallInterval,
      markingMode: markingMode,
      playerEntryFee: playerEntryFee,
      profitPercentage: profitPercentage,
    );
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> prepareGame(String gameId) async {
    return await _remoteDataSource.prepareGame(gameId);
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> startGame(String gameId) async {
    return await _remoteDataSource.startGame(gameId);
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> pauseGame(String gameId) async {
    return await _remoteDataSource.pauseGame(gameId);
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> resumeGame(String gameId) async {
    return await _remoteDataSource.resumeGame(gameId);
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> stopGame(String gameId) async {
    return await _remoteDataSource.stopGame(gameId);
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> callNumber(String gameId) async {
    return await _remoteDataSource.callNumber(gameId);
  }
}
