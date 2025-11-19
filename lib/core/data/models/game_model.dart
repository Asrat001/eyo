import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/game.dart' as entity;
import '../../domain/entities/bingo_card.dart';

part 'game_model.freezed.dart';
part 'game_model.g.dart';

@freezed
class GameModel with _$GameModel {
  const factory GameModel({
    required String id,
    required String pin,
    required String hostId,
    @Default([]) List<String> playerIds,
    @Default('waiting') String status,
    @Default('anyLine') String winPattern,
    @Default(50) int maxPlayers,
    @Default(0) int entryFee,
    @Default(0) int prizePool,
    @Default([]) List<int> calledNumbers,
    String? winnerId,
    required DateTime createdAt,
    DateTime? startedAt,
    DateTime? endedAt,
    @Default(3) int numberCallInterval,
  }) = _GameModel;

  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);

  factory GameModel.fromEntity(entity.Game game) {
    return GameModel(
      id: game.id,
      pin: game.pin,
      hostId: game.hostId,
      playerIds: game.playerIds,
      status: game.status.name,
      winPattern: game.winPattern.name,
      maxPlayers: game.maxPlayers,
      entryFee: game.entryFee,
      prizePool: game.prizePool,
      calledNumbers: game.calledNumbers,
      winnerId: game.winnerId,
      createdAt: game.createdAt,
      startedAt: game.startedAt,
      endedAt: game.endedAt,
      numberCallInterval: game.numberCallInterval,
    );
  }
}

extension GameModelX on GameModel {
  entity.Game toEntity() {
    return entity.Game(
      id: id,
      pin: pin,
      hostId: hostId,
      playerIds: playerIds,
      status: entity.GameStatus.values.firstWhere(
        (e) => e.name == status,
        orElse: () => entity.GameStatus.waiting,
      ),
      winPattern: WinPattern.values.firstWhere(
        (e) => e.name == winPattern,
        orElse: () => WinPattern.anyLine,
      ),
      maxPlayers: maxPlayers,
      entryFee: entryFee,
      prizePool: prizePool,
      calledNumbers: calledNumbers,
      winnerId: winnerId,
      createdAt: createdAt,
      startedAt: startedAt,
      endedAt: endedAt,
      numberCallInterval: numberCallInterval,
    );
  }
}
