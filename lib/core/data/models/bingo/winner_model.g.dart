// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'winner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WinnerModelImpl _$$WinnerModelImplFromJson(Map<String, dynamic> json) =>
    _$WinnerModelImpl(
      playerId: json['playerId'] as String,
      playerName: json['playerName'] as String,
      cardNumber: (json['cardNumber'] as num).toInt(),
      pattern: json['pattern'] as String,
      completedAt: DateTime.parse(json['completedAt'] as String),
      winningCard: (json['winningCard'] as List<dynamic>)
          .map(
            (e) => (e as List<dynamic>).map((e) => (e as num).toInt()).toList(),
          )
          .toList(),
      markedCells: (json['markedCells'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as bool).toList())
          .toList(),
    );

Map<String, dynamic> _$$WinnerModelImplToJson(_$WinnerModelImpl instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'playerName': instance.playerName,
      'cardNumber': instance.cardNumber,
      'pattern': instance.pattern,
      'completedAt': instance.completedAt.toIso8601String(),
      'winningCard': instance.winningCard,
      'markedCells': instance.markedCells,
    };
