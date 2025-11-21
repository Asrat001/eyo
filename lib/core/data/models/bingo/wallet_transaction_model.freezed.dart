// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WalletTransactionModel _$WalletTransactionModelFromJson(
  Map<String, dynamic> json,
) {
  return _WalletTransactionModel.fromJson(json);
}

/// @nodoc
mixin _$WalletTransactionModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // game_join, game_win, game_profit, admin_add, admin_subtract
  double get amount => throw _privateConstructorUsedError;
  double get balanceBefore => throw _privateConstructorUsedError;
  double get balanceAfter => throw _privateConstructorUsedError;
  String? get gameId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get performedBy => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this WalletTransactionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletTransactionModelCopyWith<WalletTransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletTransactionModelCopyWith<$Res> {
  factory $WalletTransactionModelCopyWith(
    WalletTransactionModel value,
    $Res Function(WalletTransactionModel) then,
  ) = _$WalletTransactionModelCopyWithImpl<$Res, WalletTransactionModel>;
  @useResult
  $Res call({
    String id,
    String userId,
    String type,
    double amount,
    double balanceBefore,
    double balanceAfter,
    String? gameId,
    String description,
    String? performedBy,
    DateTime createdAt,
  });
}

/// @nodoc
class _$WalletTransactionModelCopyWithImpl<
  $Res,
  $Val extends WalletTransactionModel
>
    implements $WalletTransactionModelCopyWith<$Res> {
  _$WalletTransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? amount = null,
    Object? balanceBefore = null,
    Object? balanceAfter = null,
    Object? gameId = freezed,
    Object? description = null,
    Object? performedBy = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            balanceBefore: null == balanceBefore
                ? _value.balanceBefore
                : balanceBefore // ignore: cast_nullable_to_non_nullable
                      as double,
            balanceAfter: null == balanceAfter
                ? _value.balanceAfter
                : balanceAfter // ignore: cast_nullable_to_non_nullable
                      as double,
            gameId: freezed == gameId
                ? _value.gameId
                : gameId // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            performedBy: freezed == performedBy
                ? _value.performedBy
                : performedBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WalletTransactionModelImplCopyWith<$Res>
    implements $WalletTransactionModelCopyWith<$Res> {
  factory _$$WalletTransactionModelImplCopyWith(
    _$WalletTransactionModelImpl value,
    $Res Function(_$WalletTransactionModelImpl) then,
  ) = __$$WalletTransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String type,
    double amount,
    double balanceBefore,
    double balanceAfter,
    String? gameId,
    String description,
    String? performedBy,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$WalletTransactionModelImplCopyWithImpl<$Res>
    extends
        _$WalletTransactionModelCopyWithImpl<$Res, _$WalletTransactionModelImpl>
    implements _$$WalletTransactionModelImplCopyWith<$Res> {
  __$$WalletTransactionModelImplCopyWithImpl(
    _$WalletTransactionModelImpl _value,
    $Res Function(_$WalletTransactionModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WalletTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? amount = null,
    Object? balanceBefore = null,
    Object? balanceAfter = null,
    Object? gameId = freezed,
    Object? description = null,
    Object? performedBy = freezed,
    Object? createdAt = null,
  }) {
    return _then(
      _$WalletTransactionModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        balanceBefore: null == balanceBefore
            ? _value.balanceBefore
            : balanceBefore // ignore: cast_nullable_to_non_nullable
                  as double,
        balanceAfter: null == balanceAfter
            ? _value.balanceAfter
            : balanceAfter // ignore: cast_nullable_to_non_nullable
                  as double,
        gameId: freezed == gameId
            ? _value.gameId
            : gameId // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        performedBy: freezed == performedBy
            ? _value.performedBy
            : performedBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletTransactionModelImpl implements _WalletTransactionModel {
  const _$WalletTransactionModelImpl({
    required this.id,
    required this.userId,
    required this.type,
    required this.amount,
    required this.balanceBefore,
    required this.balanceAfter,
    this.gameId,
    required this.description,
    this.performedBy,
    required this.createdAt,
  });

  factory _$WalletTransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletTransactionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String type;
  // game_join, game_win, game_profit, admin_add, admin_subtract
  @override
  final double amount;
  @override
  final double balanceBefore;
  @override
  final double balanceAfter;
  @override
  final String? gameId;
  @override
  final String description;
  @override
  final String? performedBy;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'WalletTransactionModel(id: $id, userId: $userId, type: $type, amount: $amount, balanceBefore: $balanceBefore, balanceAfter: $balanceAfter, gameId: $gameId, description: $description, performedBy: $performedBy, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletTransactionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.balanceBefore, balanceBefore) ||
                other.balanceBefore == balanceBefore) &&
            (identical(other.balanceAfter, balanceAfter) ||
                other.balanceAfter == balanceAfter) &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.performedBy, performedBy) ||
                other.performedBy == performedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    type,
    amount,
    balanceBefore,
    balanceAfter,
    gameId,
    description,
    performedBy,
    createdAt,
  );

  /// Create a copy of WalletTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletTransactionModelImplCopyWith<_$WalletTransactionModelImpl>
  get copyWith =>
      __$$WalletTransactionModelImplCopyWithImpl<_$WalletTransactionModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletTransactionModelImplToJson(this);
  }
}

abstract class _WalletTransactionModel implements WalletTransactionModel {
  const factory _WalletTransactionModel({
    required final String id,
    required final String userId,
    required final String type,
    required final double amount,
    required final double balanceBefore,
    required final double balanceAfter,
    final String? gameId,
    required final String description,
    final String? performedBy,
    required final DateTime createdAt,
  }) = _$WalletTransactionModelImpl;

  factory _WalletTransactionModel.fromJson(Map<String, dynamic> json) =
      _$WalletTransactionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get type; // game_join, game_win, game_profit, admin_add, admin_subtract
  @override
  double get amount;
  @override
  double get balanceBefore;
  @override
  double get balanceAfter;
  @override
  String? get gameId;
  @override
  String get description;
  @override
  String? get performedBy;
  @override
  DateTime get createdAt;

  /// Create a copy of WalletTransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletTransactionModelImplCopyWith<_$WalletTransactionModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
