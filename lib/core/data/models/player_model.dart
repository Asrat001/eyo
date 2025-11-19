import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/player.dart' as entity;

part 'player_model.freezed.dart';
part 'player_model.g.dart';

@freezed
class PlayerModel with _$PlayerModel {
  const factory PlayerModel({
    required String id,
    required String name,
    String? avatarUrl,
    @Default(0) int balance,
    @Default(0) int totalGamesPlayed,
    @Default(0) int totalWins,
    required DateTime joinedAt,
    @Default(false) bool isOnline,
  }) = _PlayerModel;

  factory PlayerModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerModelFromJson(json);

  factory PlayerModel.fromEntity(entity.Player player) {
    return PlayerModel(
      id: player.id,
      name: player.name,
      avatarUrl: player.avatarUrl,
      balance: player.balance,
      totalGamesPlayed: player.totalGamesPlayed,
      totalWins: player.totalWins,
      joinedAt: player.joinedAt,
      isOnline: player.isOnline,
    );
  }
}

extension PlayerModelX on PlayerModel {
  entity.Player toEntity() {
    return entity.Player(
      id: id,
      name: name,
      avatarUrl: avatarUrl,
      balance: balance,
      totalGamesPlayed: totalGamesPlayed,
      totalWins: totalWins,
      joinedAt: joinedAt,
      isOnline: isOnline,
    );
  }
}
