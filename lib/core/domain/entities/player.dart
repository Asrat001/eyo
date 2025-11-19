import 'package:equatable/equatable.dart';

/// Represents a player in the game
class Player extends Equatable {
  final String id;
  final String name;
  final String? avatarUrl;
  final int balance;
  final int totalGamesPlayed;
  final int totalWins;
  final DateTime joinedAt;
  final bool isOnline;

  const Player({
    required this.id,
    required this.name,
    this.avatarUrl,
    this.balance = 0,
    this.totalGamesPlayed = 0,
    this.totalWins = 0,
    required this.joinedAt,
    this.isOnline = false,
  });

  Player copyWith({
    String? id,
    String? name,
    String? avatarUrl,
    int? balance,
    int? totalGamesPlayed,
    int? totalWins,
    DateTime? joinedAt,
    bool? isOnline,
  }) {
    return Player(
      id: id ?? this.id,
      name: name ?? this.name,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      balance: balance ?? this.balance,
      totalGamesPlayed: totalGamesPlayed ?? this.totalGamesPlayed,
      totalWins: totalWins ?? this.totalWins,
      joinedAt: joinedAt ?? this.joinedAt,
      isOnline: isOnline ?? this.isOnline,
    );
  }

  double get winRate {
    if (totalGamesPlayed == 0) return 0.0;
    return (totalWins / totalGamesPlayed) * 100;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        avatarUrl,
        balance,
        totalGamesPlayed,
        totalWins,
        joinedAt,
        isOnline,
      ];
}
