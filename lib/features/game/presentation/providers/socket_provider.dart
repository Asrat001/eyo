import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/service/socket_service.dart';
import '../../../core/domain/entities/game.dart';
import '../../../core/domain/entities/player.dart';
import '../../../di.dart';
import 'game_provider.dart';

part 'socket_provider.g.dart';

/// Socket service provider
@riverpod
SocketService socketService(SocketServiceRef ref) {
  return sl<SocketService>();
}

/// Socket event listener provider
@riverpod
class SocketEventListener extends _$SocketEventListener {
  @override
  void build() {
    final socketService = ref.watch(socketServiceProvider);
    
    // Listen to game events
    socketService.gameEventStream.listen((event) {
      _handleGameEvent(event);
    });
    
    // Listen to errors
    socketService.errorStream.listen((error) {
      _handleError(error);
    });
  }

  void _handleGameEvent(Map<String, dynamic> event) {
    final eventType = event['event'] as String;
    final data = event['data'];

    switch (eventType) {
      case 'game:started':
        _onGameStarted(data);
        break;
      case 'game:updated':
        _onGameUpdated(data);
        break;
      case 'number:called':
        _onNumberCalled(data);
        break;
      case 'player:joined':
        _onPlayerJoined(data);
        break;
      case 'player:left':
        _onPlayerLeft(data);
        break;
      case 'bingo:claimed':
        _onBingoClaimed(data);
        break;
      case 'game:ended':
        _onGameEnded(data);
        break;
    }
  }

  void _onGameStarted(dynamic data) {
    // Update game state
    // TODO: Parse game data and update provider
  }

  void _onGameUpdated(dynamic data) {
    // Update game state
  }

  void _onNumberCalled(dynamic data) {
    final number = data['number'] as int;
    
    // Add to called numbers list
    ref.read(calledNumbersProvider.notifier).addNumber(number);
    
    // Automatically mark the number on player's card
    ref.read(playerCardProvider.notifier).markNumber(number);
    
    // Log for debugging
    print('🎯 Number $number called and auto-marked on card');
  }

  void _onPlayerJoined(dynamic data) {
    // TODO: Parse player data and add to list
    final playerId = data['playerId'] as String;
    final playerName = data['playerName'] as String?;
    
    // Add player to list
    // ref.read(gamePlayersProvider.notifier).addPlayer(player);
  }

  void _onPlayerLeft(dynamic data) {
    final playerId = data['playerId'] as String;
    ref.read(gamePlayersProvider.notifier).removePlayer(playerId);
  }

  void _onBingoClaimed(dynamic data) {
    final playerId = data['playerId'] as String;
    // Show notification or update UI
  }

  void _onGameEnded(dynamic data) {
    final winnerId = data['winnerId'] as String?;
    // Update game state to finished
  }

  void _handleError(String error) {
    // Handle socket errors
    // Could show snackbar or error dialog
  }
}

/// Connect to game room
@riverpod
class GameRoomConnection extends _$GameRoomConnection {
  @override
  bool build() {
    return false;
  }

  Future<void> joinGame(String gameId, String playerId) async {
    final socketService = ref.read(socketServiceProvider);
    socketService.joinGame(gameId, playerId);
    state = true;
  }

  void leaveGame(String gameId, String playerId) {
    final socketService = ref.read(socketServiceProvider);
    socketService.leaveGame(gameId, playerId);
    state = false;
  }
}

/// Claim bingo action
@riverpod
class BingoClaimAction extends _$BingoClaimAction {
  @override
  bool build() {
    return false; // Not claiming
  }

  Future<void> claimBingo(String gameId, String playerId) async {
    state = true; // Claiming in progress
    
    final socketService = ref.read(socketServiceProvider);
    socketService.claimBingo(gameId, playerId);
    
    // Wait for server response
    await Future.delayed(const Duration(seconds: 2));
    state = false;
  }
}
