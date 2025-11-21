import 'package:freezed_annotation/freezed_annotation.dart';

part 'bingo_card_model.freezed.dart';
part 'bingo_card_model.g.dart';

@freezed
class BingoCardModel with _$BingoCardModel {
  const factory BingoCardModel({
    required String player,
    required int cardNumber,
    required List<List<int>> grid, // 5x5 grid [col][row]
    required List<List<bool>> marked, // 5x5 marked cells
    required DateTime joinedAt,
  }) = _BingoCardModel;

  factory BingoCardModel.fromJson(Map<String, dynamic> json) =>
      _$BingoCardModelFromJson(json);
}
