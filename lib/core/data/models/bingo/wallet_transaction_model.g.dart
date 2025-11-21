// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletTransactionModelImpl _$$WalletTransactionModelImplFromJson(
  Map<String, dynamic> json,
) => _$WalletTransactionModelImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  type: json['type'] as String,
  amount: (json['amount'] as num).toDouble(),
  balanceBefore: (json['balanceBefore'] as num).toDouble(),
  balanceAfter: (json['balanceAfter'] as num).toDouble(),
  gameId: json['gameId'] as String?,
  description: json['description'] as String,
  performedBy: json['performedBy'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$WalletTransactionModelImplToJson(
  _$WalletTransactionModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'type': instance.type,
  'amount': instance.amount,
  'balanceBefore': instance.balanceBefore,
  'balanceAfter': instance.balanceAfter,
  'gameId': instance.gameId,
  'description': instance.description,
  'performedBy': instance.performedBy,
  'createdAt': instance.createdAt.toIso8601String(),
};
