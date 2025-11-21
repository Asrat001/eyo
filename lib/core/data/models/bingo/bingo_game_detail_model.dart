import 'package:freezed_annotation/freezed_annotation.dart';

part 'bingo_game_detail_model.freezed.dart';
part 'bingo_game_detail_model.g.dart';

@freezed
class BingoGameDetailModel with _$BingoGameDetailModel {
  const factory BingoGameDetailModel({
    required String gameId,
    required String status,
    required String winningPattern,
    required int maxPlayers,
    required int currentPlayers,

    dynamic myCard, // still null in your API

    required List<int> calledNumbers,
    required int currentNumber,
    required int autoCallInterval,
    required String markingMode,
    required int playerEntryFee,
    required int profitPercentage,
    required int gameCost,

    required List<BingoWinnerModel> winners,

    required DateTime startedAt,
    required DateTime completedAt,

    required List<int> availableCards,
  }) = _BingoGameDetailModel;

  factory BingoGameDetailModel.fromJson(Map<String, dynamic> json) =>
      _$BingoGameDetailModelFromJson(json);
}

@freezed
abstract class BingoWinnerModel with _$BingoWinnerModel {
  const factory BingoWinnerModel({
    required BingoWinnerPlayerModel player,
    required int cardNumber,
    required String pattern,
    required DateTime completedAt,
  }) = _BingoWinnerModel;

  factory BingoWinnerModel.fromJson(Map<String, dynamic> json) =>
      _$BingoWinnerModelFromJson(json);
}

@freezed
abstract class BingoWinnerPlayerModel with _$BingoWinnerPlayerModel {
  const factory BingoWinnerPlayerModel({
    @JsonKey(name: "_id") required String id,
    required String username,
  }) = _BingoWinnerPlayerModel;

  factory BingoWinnerPlayerModel.fromJson(Map<String, dynamic> json) =>
      _$BingoWinnerPlayerModelFromJson(json);
}
