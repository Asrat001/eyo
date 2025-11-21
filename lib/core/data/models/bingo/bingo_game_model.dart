import 'package:freezed_annotation/freezed_annotation.dart';
import 'bingo_card_model.dart';
import 'winner_model.dart';

part 'bingo_game_model.freezed.dart';
part 'bingo_game_model.g.dart';

@freezed
class BingoGameModel with _$BingoGameModel {
  const factory BingoGameModel({
    @JsonKey(name: '_id',defaultValue: "")
     required String id,
    required String gameId,
    String? gamePin,
    required int maxPlayers,
    required int currentPlayers,
    required String status, // preparing, ready, active, paused, completed
    required String winningPattern,
    required int autoCallInterval,
    String? markingMode, // auto, manual - optional since not in all responses
    int? gameCost,
    int? profitPercentage,
    double? playerEntryFee,
    @Default([]) List<dynamic> players, // Can be String IDs or objects
    @Default([]) List<BingoCardModel> bingoCards,
    @Default([]) List<int> calledNumbers,
    @Default([]) List<int> availableCards,
    int? currentNumber,
    @Default([]) List<WinnerModel> winners,
    required String createdBy,
    DateTime? startedAt,
    DateTime? completedAt,
    required DateTime createdAt,
    int? calledNumbersCount,
    bool? hasWinner,
  }) = _BingoGameModel;

  factory BingoGameModel.fromJson(Map<String, dynamic> json) =>
      _$BingoGameModelFromJson(json);
}
