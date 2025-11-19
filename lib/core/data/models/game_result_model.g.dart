// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameResultModelImpl _$$GameResultModelImplFromJson(
  Map<String, dynamic> json,
) => _$GameResultModelImpl(
  gameId: json['gameId'] as String,
  winnerId: json['winnerId'] as String,
  winnerName: json['winnerName'] as String,
  winPattern: json['winPattern'] as String,
  prizeAmount: (json['prizeAmount'] as num).toInt(),
  totalPlayers: (json['totalPlayers'] as num).toInt(),
  winningNumbers: (json['winningNumbers'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  completedAt: DateTime.parse(json['completedAt'] as String),
  gameDurationSeconds: (json['gameDurationSeconds'] as num).toInt(),
);

Map<String, dynamic> _$$GameResultModelImplToJson(
  _$GameResultModelImpl instance,
) => <String, dynamic>{
  'gameId': instance.gameId,
  'winnerId': instance.winnerId,
  'winnerName': instance.winnerName,
  'winPattern': instance.winPattern,
  'prizeAmount': instance.prizeAmount,
  'totalPlayers': instance.totalPlayers,
  'winningNumbers': instance.winningNumbers,
  'completedAt': instance.completedAt.toIso8601String(),
  'gameDurationSeconds': instance.gameDurationSeconds,
};
