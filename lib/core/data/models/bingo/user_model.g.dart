// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      isAdmin: json['isAdmin'] as bool? ?? false,
      isSuperAdmin: json['isSuperAdmin'] as bool? ?? false,
      credits: (json['credits'] as num?)?.toInt() ?? 0,
      wallet: (json['wallet'] as num?)?.toDouble() ?? 0.0,
      gameCredits:
          (json['gameCredits'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'isAdmin': instance.isAdmin,
      'isSuperAdmin': instance.isSuperAdmin,
      'credits': instance.credits,
      'wallet': instance.wallet,
      'gameCredits': instance.gameCredits,
      'email': instance.email,
    };
