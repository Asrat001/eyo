import 'package:freezed_annotation/freezed_annotation.dart';

part 'winner_model.freezed.dart';
part 'winner_model.g.dart';

@freezed
class WinnerModel with _$WinnerModel {
  const factory WinnerModel({
    required String playerId,
    required String playerName,
    required int cardNumber,
    required String pattern,
    required DateTime completedAt,
    required List<List<int>> winningCard,
    required List<List<bool>> markedCells,
  }) = _WinnerModel;

  factory WinnerModel.fromJson(Map<String, dynamic> json) =>
      _$WinnerModelFromJson(json);
}
