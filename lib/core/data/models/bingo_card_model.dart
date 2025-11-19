import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/bingo_card.dart' as entity;

part 'bingo_card_model.freezed.dart';
part 'bingo_card_model.g.dart';

@freezed
class BingoCellModel with _$BingoCellModel {
  const factory BingoCellModel({
    int? number,
    @Default(false) bool isMarked,
    @Default(false) bool isFreeSpace,
  }) = _BingoCellModel;

  factory BingoCellModel.fromJson(Map<String, dynamic> json) =>
      _$BingoCellModelFromJson(json);

  factory BingoCellModel.fromEntity(entity.BingoCell cell) {
    return BingoCellModel(
      number: cell.number,
      isMarked: cell.isMarked,
      isFreeSpace: cell.isFreeSpace,
    );
  }
}

extension BingoCellModelX on BingoCellModel {
  entity.BingoCell toEntity() {
    return entity.BingoCell(
      number: number,
      isMarked: isMarked,
      isFreeSpace: isFreeSpace,
    );
  }
}

@freezed
class BingoCardModel with _$BingoCardModel {
  const factory BingoCardModel({
    required String id,
    required List<List<BingoCellModel>> grid,
    required String playerId,
    required DateTime createdAt,
  }) = _BingoCardModel;

  factory BingoCardModel.fromJson(Map<String, dynamic> json) =>
      _$BingoCardModelFromJson(json);

  factory BingoCardModel.fromEntity(entity.BingoCard card) {
    return BingoCardModel(
      id: card.id,
      grid: card.grid
          .map((row) => row.map((cell) => BingoCellModel.fromEntity(cell)).toList())
          .toList(),
      playerId: card.playerId,
      createdAt: card.createdAt,
    );
  }
}

extension BingoCardModelX on BingoCardModel {
  entity.BingoCard toEntity() {
    return entity.BingoCard(
      id: id,
      grid: grid
          .map((row) => row.map((cell) => cell.toEntity()).toList())
          .toList(),
      playerId: playerId,
      createdAt: createdAt,
    );
  }
}
