// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bingo_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BingoCardModelImpl _$$BingoCardModelImplFromJson(Map<String, dynamic> json) =>
    _$BingoCardModelImpl(
      player: json['player'] as String,
      cardNumber: (json['cardNumber'] as num).toInt(),
      grid: (json['grid'] as List<dynamic>)
          .map(
            (e) => (e as List<dynamic>).map((e) => (e as num).toInt()).toList(),
          )
          .toList(),
      marked: (json['marked'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as bool).toList())
          .toList(),
      joinedAt: DateTime.parse(json['joinedAt'] as String),
    );

Map<String, dynamic> _$$BingoCardModelImplToJson(
  _$BingoCardModelImpl instance,
) => <String, dynamic>{
  'player': instance.player,
  'cardNumber': instance.cardNumber,
  'grid': instance.grid,
  'marked': instance.marked,
  'joinedAt': instance.joinedAt.toIso8601String(),
};
