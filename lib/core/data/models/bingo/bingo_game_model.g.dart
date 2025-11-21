// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bingo_game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BingoGameModelImpl _$$BingoGameModelImplFromJson(Map<String, dynamic> json) =>
    _$BingoGameModelImpl(
      id: json['_id'] as String? ?? '',
      gameId: json['gameId'] as String,
      gamePin: json['gamePin'] as String?,
      maxPlayers: (json['maxPlayers'] as num).toInt(),
      currentPlayers: (json['currentPlayers'] as num).toInt(),
      status: json['status'] as String,
      winningPattern: json['winningPattern'] as String,
      autoCallInterval: (json['autoCallInterval'] as num).toInt(),
      markingMode: json['markingMode'] as String?,
      gameCost: (json['gameCost'] as num?)?.toInt(),
      profitPercentage: (json['profitPercentage'] as num?)?.toInt(),
      playerEntryFee: (json['playerEntryFee'] as num?)?.toDouble(),
      players: json['players'] as List<dynamic>? ?? const [],
      bingoCards:
          (json['bingoCards'] as List<dynamic>?)
              ?.map((e) => BingoCardModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      calledNumbers:
          (json['calledNumbers'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      availableCards:
          (json['availableCards'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      currentNumber: (json['currentNumber'] as num?)?.toInt(),
      winners:
          (json['winners'] as List<dynamic>?)
              ?.map((e) => WinnerModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdBy: json['createdBy'] as String,
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      calledNumbersCount: (json['calledNumbersCount'] as num?)?.toInt(),
      hasWinner: json['hasWinner'] as bool?,
    );

Map<String, dynamic> _$$BingoGameModelImplToJson(
  _$BingoGameModelImpl instance,
) => <String, dynamic>{
  '_id': instance.id,
  'gameId': instance.gameId,
  'gamePin': instance.gamePin,
  'maxPlayers': instance.maxPlayers,
  'currentPlayers': instance.currentPlayers,
  'status': instance.status,
  'winningPattern': instance.winningPattern,
  'autoCallInterval': instance.autoCallInterval,
  'markingMode': instance.markingMode,
  'gameCost': instance.gameCost,
  'profitPercentage': instance.profitPercentage,
  'playerEntryFee': instance.playerEntryFee,
  'players': instance.players,
  'bingoCards': instance.bingoCards,
  'calledNumbers': instance.calledNumbers,
  'availableCards': instance.availableCards,
  'currentNumber': instance.currentNumber,
  'winners': instance.winners,
  'createdBy': instance.createdBy,
  'startedAt': instance.startedAt?.toIso8601String(),
  'completedAt': instance.completedAt?.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
  'calledNumbersCount': instance.calledNumbersCount,
  'hasWinner': instance.hasWinner,
};
