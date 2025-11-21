import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String username,
    @Default(false) bool isAdmin,
    @Default(false) bool isSuperAdmin,
    @Default(0) int credits,
    @Default(0.0) double wallet,
    @Default({}) Map<String, int> gameCredits,
    String? email,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
