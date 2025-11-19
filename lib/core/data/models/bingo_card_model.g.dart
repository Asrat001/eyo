// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bingo_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BingoCellModelImpl _$$BingoCellModelImplFromJson(Map<String, dynamic> json) =>
    _$BingoCellModelImpl(
      number: (json['number'] as num?)?.toInt(),
      isMarked: json['isMarked'] as bool? ?? false,
      isFreeSpace: json['isFreeSpace'] as bool? ?? false,
    );

Map<String, dynamic> _$$BingoCellModelImplToJson(
  _$BingoCellModelImpl instance,
) => <String, dynamic>{
  'number': instance.number,
  'isMarked': instance.isMarked,
  'isFreeSpace': instance.isFreeSpace,
};

_$BingoCardModelImpl _$$BingoCardModelImplFromJson(Map<String, dynamic> json) =>
    _$BingoCardModelImpl(
      id: json['id'] as String,
      grid: (json['grid'] as List<dynamic>)
          .map(
            (e) => (e as List<dynamic>)
                .map((e) => BingoCellModel.fromJson(e as Map<String, dynamic>))
                .toList(),
          )
          .toList(),
      playerId: json['playerId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$BingoCardModelImplToJson(
  _$BingoCardModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'grid': instance.grid,
  'playerId': instance.playerId,
  'createdAt': instance.createdAt.toIso8601String(),
};
