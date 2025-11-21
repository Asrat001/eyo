import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_transaction_model.freezed.dart';
part 'wallet_transaction_model.g.dart';

@freezed
class WalletTransactionModel with _$WalletTransactionModel {
  const factory WalletTransactionModel({
    required String id,
    required String userId,
    required String
    type, // game_join, game_win, game_profit, admin_add, admin_subtract
    required double amount,
    required double balanceBefore,
    required double balanceAfter,
    String? gameId,
    required String description,
    String? performedBy,
    required DateTime createdAt,
  }) = _WalletTransactionModel;

  factory WalletTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$WalletTransactionModelFromJson(json);
}
