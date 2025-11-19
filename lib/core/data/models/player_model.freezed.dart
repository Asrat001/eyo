// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PlayerModel _$PlayerModelFromJson(Map<String, dynamic> json) {
  return _PlayerModel.fromJson(json);
}

/// @nodoc
mixin _$PlayerModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  int get balance => throw _privateConstructorUsedError;
  int get totalGamesPlayed => throw _privateConstructorUsedError;
  int get totalWins => throw _privateConstructorUsedError;
  DateTime get joinedAt => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;

  /// Serializes this PlayerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlayerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerModelCopyWith<PlayerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerModelCopyWith<$Res> {
  factory $PlayerModelCopyWith(
    PlayerModel value,
    $Res Function(PlayerModel) then,
  ) = _$PlayerModelCopyWithImpl<$Res, PlayerModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String? avatarUrl,
    int balance,
    int totalGamesPlayed,
    int totalWins,
    DateTime joinedAt,
    bool isOnline,
  });
}

/// @nodoc
class _$PlayerModelCopyWithImpl<$Res, $Val extends PlayerModel>
    implements $PlayerModelCopyWith<$Res> {
  _$PlayerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatarUrl = freezed,
    Object? balance = null,
    Object? totalGamesPlayed = null,
    Object? totalWins = null,
    Object? joinedAt = null,
    Object? isOnline = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            balance: null == balance
                ? _value.balance
                : balance // ignore: cast_nullable_to_non_nullable
                      as int,
            totalGamesPlayed: null == totalGamesPlayed
                ? _value.totalGamesPlayed
                : totalGamesPlayed // ignore: cast_nullable_to_non_nullable
                      as int,
            totalWins: null == totalWins
                ? _value.totalWins
                : totalWins // ignore: cast_nullable_to_non_nullable
                      as int,
            joinedAt: null == joinedAt
                ? _value.joinedAt
                : joinedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            isOnline: null == isOnline
                ? _value.isOnline
                : isOnline // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlayerModelImplCopyWith<$Res>
    implements $PlayerModelCopyWith<$Res> {
  factory _$$PlayerModelImplCopyWith(
    _$PlayerModelImpl value,
    $Res Function(_$PlayerModelImpl) then,
  ) = __$$PlayerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? avatarUrl,
    int balance,
    int totalGamesPlayed,
    int totalWins,
    DateTime joinedAt,
    bool isOnline,
  });
}

/// @nodoc
class __$$PlayerModelImplCopyWithImpl<$Res>
    extends _$PlayerModelCopyWithImpl<$Res, _$PlayerModelImpl>
    implements _$$PlayerModelImplCopyWith<$Res> {
  __$$PlayerModelImplCopyWithImpl(
    _$PlayerModelImpl _value,
    $Res Function(_$PlayerModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlayerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatarUrl = freezed,
    Object? balance = null,
    Object? totalGamesPlayed = null,
    Object? totalWins = null,
    Object? joinedAt = null,
    Object? isOnline = null,
  }) {
    return _then(
      _$PlayerModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        balance: null == balance
            ? _value.balance
            : balance // ignore: cast_nullable_to_non_nullable
                  as int,
        totalGamesPlayed: null == totalGamesPlayed
            ? _value.totalGamesPlayed
            : totalGamesPlayed // ignore: cast_nullable_to_non_nullable
                  as int,
        totalWins: null == totalWins
            ? _value.totalWins
            : totalWins // ignore: cast_nullable_to_non_nullable
                  as int,
        joinedAt: null == joinedAt
            ? _value.joinedAt
            : joinedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isOnline: null == isOnline
            ? _value.isOnline
            : isOnline // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerModelImpl implements _PlayerModel {
  const _$PlayerModelImpl({
    required this.id,
    required this.name,
    this.avatarUrl,
    this.balance = 0,
    this.totalGamesPlayed = 0,
    this.totalWins = 0,
    required this.joinedAt,
    this.isOnline = false,
  });

  factory _$PlayerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? avatarUrl;
  @override
  @JsonKey()
  final int balance;
  @override
  @JsonKey()
  final int totalGamesPlayed;
  @override
  @JsonKey()
  final int totalWins;
  @override
  final DateTime joinedAt;
  @override
  @JsonKey()
  final bool isOnline;

  @override
  String toString() {
    return 'PlayerModel(id: $id, name: $name, avatarUrl: $avatarUrl, balance: $balance, totalGamesPlayed: $totalGamesPlayed, totalWins: $totalWins, joinedAt: $joinedAt, isOnline: $isOnline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.totalGamesPlayed, totalGamesPlayed) ||
                other.totalGamesPlayed == totalGamesPlayed) &&
            (identical(other.totalWins, totalWins) ||
                other.totalWins == totalWins) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    avatarUrl,
    balance,
    totalGamesPlayed,
    totalWins,
    joinedAt,
    isOnline,
  );

  /// Create a copy of PlayerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerModelImplCopyWith<_$PlayerModelImpl> get copyWith =>
      __$$PlayerModelImplCopyWithImpl<_$PlayerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerModelImplToJson(this);
  }
}

abstract class _PlayerModel implements PlayerModel {
  const factory _PlayerModel({
    required final String id,
    required final String name,
    final String? avatarUrl,
    final int balance,
    final int totalGamesPlayed,
    final int totalWins,
    required final DateTime joinedAt,
    final bool isOnline,
  }) = _$PlayerModelImpl;

  factory _PlayerModel.fromJson(Map<String, dynamic> json) =
      _$PlayerModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get avatarUrl;
  @override
  int get balance;
  @override
  int get totalGamesPlayed;
  @override
  int get totalWins;
  @override
  DateTime get joinedAt;
  @override
  bool get isOnline;

  /// Create a copy of PlayerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerModelImplCopyWith<_$PlayerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
