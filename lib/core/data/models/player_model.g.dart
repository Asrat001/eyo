// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerModelImpl _$$PlayerModelImplFromJson(Map<String, dynamic> json) =>
    _$PlayerModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      balance: (json['balance'] as num?)?.toInt() ?? 0,
      totalGamesPlayed: (json['totalGamesPlayed'] as num?)?.toInt() ?? 0,
      totalWins: (json['totalWins'] as num?)?.toInt() ?? 0,
      joinedAt: DateTime.parse(json['joinedAt'] as String),
      isOnline: json['isOnline'] as bool? ?? false,
    );

Map<String, dynamic> _$$PlayerModelImplToJson(_$PlayerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'balance': instance.balance,
      'totalGamesPlayed': instance.totalGamesPlayed,
      'totalWins': instance.totalWins,
      'joinedAt': instance.joinedAt.toIso8601String(),
      'isOnline': instance.isOnline,
    };
