import 'package:equatable/equatable.dart';
import 'bingo_card.dart';

/// Represents the result of a completed game
class GameResult extends Equatable {
  final String gameId;
  final String winnerId;
  final String winnerName;
  final WinPattern winPattern;
  final int prizeAmount;
  final int totalPlayers;
  final List<int> winningNumbers; // Numbers that completed the winning pattern
  final DateTime completedAt;
  final Duration gameDuration;

  const GameResult({
    required this.gameId,
    required this.winnerId,
    required this.winnerName,
    required this.winPattern,
    required this.prizeAmount,
    required this.totalPlayers,
    required this.winningNumbers,
    required this.completedAt,
    required this.gameDuration,
  });

  @override
  List<Object?> get props => [
        gameId,
        winnerId,
        winnerName,
        winPattern,
        prizeAmount,
        totalPlayers,
        winningNumbers,
        completedAt,
        gameDuration,
      ];
}
