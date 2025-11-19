import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/game_result.dart' as entity;
import '../../domain/entities/bingo_card.dart';

part 'game_result_model.freezed.dart';
part 'game_result_model.g.dart';

@freezed
class GameResultModel with _$GameResultModel {
  const factory GameResultModel({
    required String gameId,
    required String winnerId,
    required String winnerName,
    required String winPattern,
    required int prizeAmount,
    required int totalPlayers,
    required List<int> winningNumbers,
    required DateTime completedAt,
    required int gameDurationSeconds,
  }) = _GameResultModel;

  factory GameResultModel.fromJson(Map<String, dynamic> json) =>
      _$GameResultModelFromJson(json);

  factory GameResultModel.fromEntity(entity.GameResult result) {
    return GameResultModel(
      gameId: result.gameId,
      winnerId: result.winnerId,
      winnerName: result.winnerName,
      winPattern: result.winPattern.name,
      prizeAmount: result.prizeAmount,
      totalPlayers: result.totalPlayers,
      winningNumbers: result.winningNumbers,
      completedAt: result.completedAt,
      gameDurationSeconds: result.gameDuration.inSeconds,
    );
  }
}

extension GameResultModelX on GameResultModel {
  entity.GameResult toEntity() {
    return entity.GameResult(
      gameId: gameId,
      winnerId: winnerId,
      winnerName: winnerName,
      winPattern: WinPattern.values.firstWhere(
        (e) => e.name == winPattern,
        orElse: () => WinPattern.anyLine,
      ),
      prizeAmount: prizeAmount,
      totalPlayers: totalPlayers,
      winningNumbers: winningNumbers,
      completedAt: completedAt,
      gameDuration: Duration(seconds: gameDurationSeconds),
    );
  }
}
