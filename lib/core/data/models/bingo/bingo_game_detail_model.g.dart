// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bingo_game_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BingoGameDetailModelImpl _$$BingoGameDetailModelImplFromJson(
  Map<String, dynamic> json,
) => _$BingoGameDetailModelImpl(
  gameId: json['gameId'] as String,
  status: json['status'] as String,
  winningPattern: json['winningPattern'] as String,
  maxPlayers: (json['maxPlayers'] as num).toInt(),
  currentPlayers: (json['currentPlayers'] as num).toInt(),
  myCard: json['myCard'],
  calledNumbers: (json['calledNumbers'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  currentNumber: (json['currentNumber'] as num).toInt(),
  autoCallInterval: (json['autoCallInterval'] as num).toInt(),
  markingMode: json['markingMode'] as String,
  playerEntryFee: (json['playerEntryFee'] as num).toInt(),
  profitPercentage: (json['profitPercentage'] as num).toInt(),
  gameCost: (json['gameCost'] as num).toInt(),
  winners: (json['winners'] as List<dynamic>)
      .map((e) => BingoWinnerModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  startedAt: DateTime.parse(json['startedAt'] as String),
  completedAt: DateTime.parse(json['completedAt'] as String),
  availableCards: (json['availableCards'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$$BingoGameDetailModelImplToJson(
  _$BingoGameDetailModelImpl instance,
) => <String, dynamic>{
  'gameId': instance.gameId,
  'status': instance.status,
  'winningPattern': instance.winningPattern,
  'maxPlayers': instance.maxPlayers,
  'currentPlayers': instance.currentPlayers,
  'myCard': instance.myCard,
  'calledNumbers': instance.calledNumbers,
  'currentNumber': instance.currentNumber,
  'autoCallInterval': instance.autoCallInterval,
  'markingMode': instance.markingMode,
  'playerEntryFee': instance.playerEntryFee,
  'profitPercentage': instance.profitPercentage,
  'gameCost': instance.gameCost,
  'winners': instance.winners,
  'startedAt': instance.startedAt.toIso8601String(),
  'completedAt': instance.completedAt.toIso8601String(),
  'availableCards': instance.availableCards,
};

_$BingoWinnerModelImpl _$$BingoWinnerModelImplFromJson(
  Map<String, dynamic> json,
) => _$BingoWinnerModelImpl(
  player: BingoWinnerPlayerModel.fromJson(
    json['player'] as Map<String, dynamic>,
  ),
  cardNumber: (json['cardNumber'] as num).toInt(),
  pattern: json['pattern'] as String,
  completedAt: DateTime.parse(json['completedAt'] as String),
);

Map<String, dynamic> _$$BingoWinnerModelImplToJson(
  _$BingoWinnerModelImpl instance,
) => <String, dynamic>{
  'player': instance.player,
  'cardNumber': instance.cardNumber,
  'pattern': instance.pattern,
  'completedAt': instance.completedAt.toIso8601String(),
};

_$BingoWinnerPlayerModelImpl _$$BingoWinnerPlayerModelImplFromJson(
  Map<String, dynamic> json,
) => _$BingoWinnerPlayerModelImpl(
  id: json['_id'] as String,
  username: json['username'] as String,
);

Map<String, dynamic> _$$BingoWinnerPlayerModelImplToJson(
  _$BingoWinnerPlayerModelImpl instance,
) => <String, dynamic>{'_id': instance.id, 'username': instance.username};
