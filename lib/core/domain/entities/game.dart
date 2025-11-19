import 'package:equatable/equatable.dart';
import 'bingo_card.dart';
import 'player.dart';

/// Game status enum
enum GameStatus {
  waiting, // Waiting for players to join
  starting, // Countdown before game starts
  inProgress, // Game is active
  finished, // Game has ended
  cancelled, // Game was cancelled
}

/// Represents a bingo game session
class Game extends Equatable {
  final String id;
  final String pin; // 4-6 digit PIN for joining
  final String hostId;
  final List<String> playerIds;
  final GameStatus status;
  final WinPattern winPattern;
  final int maxPlayers;
  final int entryFee;
  final int prizePool;
  final List<int> calledNumbers;
  final String? winnerId;
  final DateTime createdAt;
  final DateTime? startedAt;
  final DateTime? endedAt;
  final int numberCallInterval; // seconds between number calls

  const Game({
    required this.id,
    required this.pin,
    required this.hostId,
    this.playerIds = const [],
    this.status = GameStatus.waiting,
    this.winPattern = WinPattern.anyLine,
    this.maxPlayers = 50,
    this.entryFee = 0,
    this.prizePool = 0,
    this.calledNumbers = const [],
    this.winnerId,
    required this.createdAt,
    this.startedAt,
    this.endedAt,
    this.numberCallInterval = 3,
  });

  Game copyWith({
    String? id,
    String? pin,
    String? hostId,
    List<String>? playerIds,
    GameStatus? status,
    WinPattern? winPattern,
    int? maxPlayers,
    int? entryFee,
    int? prizePool,
    List<int>? calledNumbers,
    String? winnerId,
    DateTime? createdAt,
    DateTime? startedAt,
    DateTime? endedAt,
    int? numberCallInterval,
  }) {
    return Game(
      id: id ?? this.id,
      pin: pin ?? this.pin,
      hostId: hostId ?? this.hostId,
      playerIds: playerIds ?? this.playerIds,
      status: status ?? this.status,
      winPattern: winPattern ?? this.winPattern,
      maxPlayers: maxPlayers ?? this.maxPlayers,
      entryFee: entryFee ?? this.entryFee,
      prizePool: prizePool ?? this.prizePool,
      calledNumbers: calledNumbers ?? this.calledNumbers,
      winnerId: winnerId ?? this.winnerId,
      createdAt: createdAt ?? this.createdAt,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      numberCallInterval: numberCallInterval ?? this.numberCallInterval,
    );
  }

  bool get isFull => playerIds.length >= maxPlayers;
  bool get canStart => playerIds.length >= 2 && status == GameStatus.waiting;
  bool get isActive => status == GameStatus.inProgress;
  bool get hasEnded => status == GameStatus.finished || status == GameStatus.cancelled;

  int get currentPlayerCount => playerIds.length;

  /// Add a player to the game
  Game addPlayer(String playerId) {
    if (isFull || hasEnded) return this;
    
    final updatedPlayers = List<String>.from(playerIds)..add(playerId);
    final updatedPrizePool = prizePool + entryFee;
    
    return copyWith(
      playerIds: updatedPlayers,
      prizePool: updatedPrizePool,
    );
  }

  /// Remove a player from the game
  Game removePlayer(String playerId) {
    final updatedPlayers = List<String>.from(playerIds)..remove(playerId);
    final updatedPrizePool = prizePool - entryFee;
    
    return copyWith(
      playerIds: updatedPlayers,
      prizePool: updatedPrizePool > 0 ? updatedPrizePool : 0,
    );
  }

  /// Call a new number
  Game callNumber(int number) {
    if (!isActive) return this;
    
    final updatedNumbers = List<int>.from(calledNumbers)..add(number);
    return copyWith(calledNumbers: updatedNumbers);
  }

  /// Start the game
  Game start() {
    if (!canStart) return this;
    
    return copyWith(
      status: GameStatus.inProgress,
      startedAt: DateTime.now(),
    );
  }

  /// End the game with a winner
  Game finish(String winnerId) {
    return copyWith(
      status: GameStatus.finished,
      winnerId: winnerId,
      endedAt: DateTime.now(),
    );
  }

  /// Cancel the game
  Game cancel() {
    return copyWith(
      status: GameStatus.cancelled,
      endedAt: DateTime.now(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        pin,
        hostId,
        playerIds,
        status,
        winPattern,
        maxPlayers,
        entryFee,
        prizePool,
        calledNumbers,
        winnerId,
        createdAt,
        startedAt,
        endedAt,
        numberCallInterval,
      ];
}
