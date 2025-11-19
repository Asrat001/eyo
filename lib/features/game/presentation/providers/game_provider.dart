import 'package:eyo_bingo/core/domain/entities/bingo_card.dart';
import 'package:eyo_bingo/core/domain/entities/game.dart';
import 'package:eyo_bingo/core/domain/entities/player.dart';
import 'package:eyo_bingo/core/game_engine/game_coordinator.dart';
import 'package:eyo_bingo/core/service/socket_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../di.dart';


part 'game_provider.g.dart';

/// Game coordinator provider
@riverpod
GameCoordinator gameCoordinator(GameCoordinatorRef ref) {
  return GameCoordinator();
}

/// Current game state provider
@riverpod
class CurrentGame extends _$CurrentGame {
  @override
  Game? build() {
    return null;
  }

  void setGame(Game game) {
    state = game;
  }

  void updateGame(Game game) {
    state = game;
  }

  void clearGame() {
    state = null;
  }
}

/// Player's bingo card provider
@riverpod
class PlayerCard extends _$PlayerCard {
  @override
  BingoCard? build() {
    return null;
  }

  void setCard(BingoCard card) {
    state = card;
  }

  void markNumber(int number) {
    if (state != null) {
      final oldCard = state!;
      state = state!.markNumber(number);
      
      // Log if number was actually on the card
      final wasMarked = state != oldCard;
      if (wasMarked) {
        print('✅ Number $number marked on card');
      } else {
        print('ℹ️ Number $number not on this card');
      }
    }
  }

  void clearCard() {
    state = null;
  }
}

/// Called numbers provider
@riverpod
class CalledNumbers extends _$CalledNumbers {
  @override
  List<int> build() {
    return [];
  }

  void addNumber(int number) {
    state = [...state, number];
  }

  void setNumbers(List<int> numbers) {
    state = numbers;
  }

  void clear() {
    state = [];
  }

  int? get latest => state.isEmpty ? null : state.last;
}

/// Players in game provider
@riverpod
class GamePlayers extends _$GamePlayers {
  @override
  List<Player> build() {
    return [];
  }

  void setPlayers(List<Player> players) {
    state = players;
  }

  void addPlayer(Player player) {
    state = [...state, player];
  }

  void removePlayer(String playerId) {
    state = state.where((p) => p.id != playerId).toList();
  }

  void updatePlayer(Player player) {
    state = state.map((p) => p.id == player.id ? player : p).toList();
  }

  void clear() {
    state = [];
  }
}

/// Socket connection state provider
@riverpod
class SocketConnection extends _$SocketConnection {
  @override
  bool build() {
    final socketService = sl<SocketService>();
    
    // Listen to connection stream
    socketService.connectionStream.listen((isConnected) {
      state = isConnected;
    });
    
    return socketService.isConnected;
  }

  void updateConnectionState(bool isConnected) {
    state = isConnected;
  }
}

/// Current player ID provider (from auth)
@riverpod
String? currentPlayerId(CurrentPlayerIdRef ref) {
  // TODO: Get from auth service
  return 'demo-player-1';
}

/// Can claim bingo provider
@riverpod
bool canClaimBingo(CanClaimBingoRef ref) {
  final card = ref.watch(playerCardProvider);
  final game = ref.watch(currentGameProvider);
  
  if (card == null || game == null) return false;
  if (game.status != GameStatus.inProgress) return false;
  
  // Check if card has winning pattern
  return card.checkWin(game.winPattern);
}

/// Game status text provider
@riverpod
String gameStatusText(GameStatusTextRef ref) {
  final game = ref.watch(currentGameProvider);
  
  if (game == null) return 'No active game';
  
  switch (game.status) {
    case GameStatus.waiting:
      return 'Waiting for players...';
    case GameStatus.starting:
      return 'Game starting...';
    case GameStatus.inProgress:
      return 'Game in progress';
    case GameStatus.finished:
      return 'Game finished';
    case GameStatus.cancelled:
      return 'Game cancelled';
  }
}
