import 'package:equatable/equatable.dart';

/// Overall analytics model
class OverallAnalytics extends Equatable {
  final int totalAdmins;
  final int totalGamesCreated;
  final int totalCompletedGames;
  final int totalActiveGames;
  final double totalRevenue;
  final double totalProfit;
  final int totalPlayers;
  final int totalCreditsInSystem;
  final double totalCreditsSpent;

  const OverallAnalytics({
    required this.totalAdmins,
    required this.totalGamesCreated,
    required this.totalCompletedGames,
    required this.totalActiveGames,
    required this.totalRevenue,
    required this.totalProfit,
    required this.totalPlayers,
    required this.totalCreditsInSystem,
    required this.totalCreditsSpent,
  });

  factory OverallAnalytics.fromJson(Map<String, dynamic> json) {
    return OverallAnalytics(
      totalAdmins: json['totalAdmins'] ?? 0,
      totalGamesCreated: json['totalGamesCreated'] ?? 0,
      totalCompletedGames: json['totalCompletedGames'] ?? 0,
      totalActiveGames: json['totalActiveGames'] ?? 0,
      totalRevenue: _parseDouble(json['totalRevenue']),
      totalProfit: _parseDouble(json['totalProfit']),
      totalPlayers: json['totalPlayers'] ?? 0,
      totalCreditsInSystem: json['totalCreditsInSystem'] ?? 0,
      totalCreditsSpent: _parseDouble(json['totalCreditsSpent']),
    );
  }

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  @override
  List<Object?> get props => [
    totalAdmins,
    totalGamesCreated,
    totalCompletedGames,
    totalActiveGames,
    totalRevenue,
    totalProfit,
    totalPlayers,
    totalCreditsInSystem,
    totalCreditsSpent,
  ];
}

/// Game statistics model (used for numberBingo and combined)
class GameStats extends Equatable {
  final int totalGames;
  final int completedGames;
  final int activeGames;
  final double totalRevenue;
  final double totalProfit;
  final int totalPlayers;

  const GameStats({
    required this.totalGames,
    required this.completedGames,
    required this.activeGames,
    required this.totalRevenue,
    required this.totalProfit,
    required this.totalPlayers,
  });

  factory GameStats.fromJson(Map<String, dynamic> json) {
    return GameStats(
      totalGames: json['totalGames'] ?? 0,
      completedGames: json['completedGames'] ?? 0,
      activeGames: json['activeGames'] ?? 0,
      totalRevenue: _parseDouble(json['totalRevenue']),
      totalProfit: _parseDouble(json['totalProfit']),
      totalPlayers: json['totalPlayers'] ?? 0,
    );
  }

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  @override
  List<Object?> get props => [
    totalGames,
    completedGames,
    activeGames,
    totalRevenue,
    totalProfit,
    totalPlayers,
  ];
}

/// Individual admin analytics model
class AdminAnalytics extends Equatable {
  final String adminId;
  final String username;
  final int currentCredits;
  final double creditsSpent;
  final Map<String, int> gameCredits;
  final GameStats numberBingo;
  final GameStats combined;
  final double averagePlayersPerGame;
  final double averageProfitPerGame;

  const AdminAnalytics({
    required this.adminId,
    required this.username,
    required this.currentCredits,
    required this.creditsSpent,
    required this.gameCredits,
    required this.numberBingo,
    required this.combined,
    required this.averagePlayersPerGame,
    required this.averageProfitPerGame,
  });

  factory AdminAnalytics.fromJson(Map<String, dynamic> json) {
    return AdminAnalytics(
      adminId: json['adminId'] ?? '',
      username: json['username'] ?? '',
      currentCredits: json['currentCredits'] ?? 0,
      creditsSpent: _parseDouble(json['creditsSpent']),
      gameCredits: Map<String, int>.from(json['gameCredits'] ?? {}),
      numberBingo: GameStats.fromJson(json['numberBingo'] ?? {}),
      combined: GameStats.fromJson(json['combined'] ?? {}),
      averagePlayersPerGame: _parseDouble(json['averagePlayersPerGame']),
      averageProfitPerGame: _parseDouble(json['averageProfitPerGame']),
    );
  }

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  @override
  List<Object?> get props => [
    adminId,
    username,
    currentCredits,
    creditsSpent,
    gameCredits,
    numberBingo,
    combined,
    averagePlayersPerGame,
    averageProfitPerGame,
  ];
}

/// Complete analytics response model
class AnalyticsResponse extends Equatable {
  final OverallAnalytics overall;
  final List<AdminAnalytics> adminAnalytics;

  const AnalyticsResponse({
    required this.overall,
    required this.adminAnalytics,
  });

  factory AnalyticsResponse.fromJson(Map<String, dynamic> json) {
    return AnalyticsResponse(
      overall: OverallAnalytics.fromJson(json['overall'] ?? {}),
      adminAnalytics:
          (json['adminAnalytics'] as List?)
              ?.map((admin) => AdminAnalytics.fromJson(admin))
              .toList() ??
          [],
    );
  }

  @override
  List<Object?> get props => [overall, adminAnalytics];
}
