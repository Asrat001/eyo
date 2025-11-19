// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameModelImpl _$$GameModelImplFromJson(Map<String, dynamic> json) =>
    _$GameModelImpl(
      id: json['id'] as String,
      pin: json['pin'] as String,
      hostId: json['hostId'] as String,
      playerIds:
          (json['playerIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      status: json['status'] as String? ?? 'waiting',
      winPattern: json['winPattern'] as String? ?? 'anyLine',
      maxPlayers: (json['maxPlayers'] as num?)?.toInt() ?? 50,
      entryFee: (json['entryFee'] as num?)?.toInt() ?? 0,
      prizePool: (json['prizePool'] as num?)?.toInt() ?? 0,
      calledNumbers:
          (json['calledNumbers'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      winnerId: json['winnerId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      startedAt: json['startedAt'] == null
          ? null
          : DateTime.parse(json['startedAt'] as String),
      endedAt: json['endedAt'] == null
          ? null
          : DateTime.parse(json['endedAt'] as String),
      numberCallInterval: (json['numberCallInterval'] as num?)?.toInt() ?? 3,
    );

Map<String, dynamic> _$$GameModelImplToJson(_$GameModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pin': instance.pin,
      'hostId': instance.hostId,
      'playerIds': instance.playerIds,
      'status': instance.status,
      'winPattern': instance.winPattern,
      'maxPlayers': instance.maxPlayers,
      'entryFee': instance.entryFee,
      'prizePool': instance.prizePool,
      'calledNumbers': instance.calledNumbers,
      'winnerId': instance.winnerId,
      'createdAt': instance.createdAt.toIso8601String(),
      'startedAt': instance.startedAt?.toIso8601String(),
      'endedAt': instance.endedAt?.toIso8601String(),
      'numberCallInterval': instance.numberCallInterval,
    };
