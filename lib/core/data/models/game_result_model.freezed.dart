// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GameResultModel _$GameResultModelFromJson(Map<String, dynamic> json) {
  return _GameResultModel.fromJson(json);
}

/// @nodoc
mixin _$GameResultModel {
  String get gameId => throw _privateConstructorUsedError;
  String get winnerId => throw _privateConstructorUsedError;
  String get winnerName => throw _privateConstructorUsedError;
  String get winPattern => throw _privateConstructorUsedError;
  int get prizeAmount => throw _privateConstructorUsedError;
  int get totalPlayers => throw _privateConstructorUsedError;
  List<int> get winningNumbers => throw _privateConstructorUsedError;
  DateTime get completedAt => throw _privateConstructorUsedError;
  int get gameDurationSeconds => throw _privateConstructorUsedError;

  /// Serializes this GameResultModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameResultModelCopyWith<GameResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameResultModelCopyWith<$Res> {
  factory $GameResultModelCopyWith(
    GameResultModel value,
    $Res Function(GameResultModel) then,
  ) = _$GameResultModelCopyWithImpl<$Res, GameResultModel>;
  @useResult
  $Res call({
    String gameId,
    String winnerId,
    String winnerName,
    String winPattern,
    int prizeAmount,
    int totalPlayers,
    List<int> winningNumbers,
    DateTime completedAt,
    int gameDurationSeconds,
  });
}

/// @nodoc
class _$GameResultModelCopyWithImpl<$Res, $Val extends GameResultModel>
    implements $GameResultModelCopyWith<$Res> {
  _$GameResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? winnerId = null,
    Object? winnerName = null,
    Object? winPattern = null,
    Object? prizeAmount = null,
    Object? totalPlayers = null,
    Object? winningNumbers = null,
    Object? completedAt = null,
    Object? gameDurationSeconds = null,
  }) {
    return _then(
      _value.copyWith(
            gameId: null == gameId
                ? _value.gameId
                : gameId // ignore: cast_nullable_to_non_nullable
                      as String,
            winnerId: null == winnerId
                ? _value.winnerId
                : winnerId // ignore: cast_nullable_to_non_nullable
                      as String,
            winnerName: null == winnerName
                ? _value.winnerName
                : winnerName // ignore: cast_nullable_to_non_nullable
                      as String,
            winPattern: null == winPattern
                ? _value.winPattern
                : winPattern // ignore: cast_nullable_to_non_nullable
                      as String,
            prizeAmount: null == prizeAmount
                ? _value.prizeAmount
                : prizeAmount // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPlayers: null == totalPlayers
                ? _value.totalPlayers
                : totalPlayers // ignore: cast_nullable_to_non_nullable
                      as int,
            winningNumbers: null == winningNumbers
                ? _value.winningNumbers
                : winningNumbers // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            completedAt: null == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            gameDurationSeconds: null == gameDurationSeconds
                ? _value.gameDurationSeconds
                : gameDurationSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GameResultModelImplCopyWith<$Res>
    implements $GameResultModelCopyWith<$Res> {
  factory _$$GameResultModelImplCopyWith(
    _$GameResultModelImpl value,
    $Res Function(_$GameResultModelImpl) then,
  ) = __$$GameResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String gameId,
    String winnerId,
    String winnerName,
    String winPattern,
    int prizeAmount,
    int totalPlayers,
    List<int> winningNumbers,
    DateTime completedAt,
    int gameDurationSeconds,
  });
}

/// @nodoc
class __$$GameResultModelImplCopyWithImpl<$Res>
    extends _$GameResultModelCopyWithImpl<$Res, _$GameResultModelImpl>
    implements _$$GameResultModelImplCopyWith<$Res> {
  __$$GameResultModelImplCopyWithImpl(
    _$GameResultModelImpl _value,
    $Res Function(_$GameResultModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameResultModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? winnerId = null,
    Object? winnerName = null,
    Object? winPattern = null,
    Object? prizeAmount = null,
    Object? totalPlayers = null,
    Object? winningNumbers = null,
    Object? completedAt = null,
    Object? gameDurationSeconds = null,
  }) {
    return _then(
      _$GameResultModelImpl(
        gameId: null == gameId
            ? _value.gameId
            : gameId // ignore: cast_nullable_to_non_nullable
                  as String,
        winnerId: null == winnerId
            ? _value.winnerId
            : winnerId // ignore: cast_nullable_to_non_nullable
                  as String,
        winnerName: null == winnerName
            ? _value.winnerName
            : winnerName // ignore: cast_nullable_to_non_nullable
                  as String,
        winPattern: null == winPattern
            ? _value.winPattern
            : winPattern // ignore: cast_nullable_to_non_nullable
                  as String,
        prizeAmount: null == prizeAmount
            ? _value.prizeAmount
            : prizeAmount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPlayers: null == totalPlayers
            ? _value.totalPlayers
            : totalPlayers // ignore: cast_nullable_to_non_nullable
                  as int,
        winningNumbers: null == winningNumbers
            ? _value._winningNumbers
            : winningNumbers // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        completedAt: null == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        gameDurationSeconds: null == gameDurationSeconds
            ? _value.gameDurationSeconds
            : gameDurationSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GameResultModelImpl implements _GameResultModel {
  const _$GameResultModelImpl({
    required this.gameId,
    required this.winnerId,
    required this.winnerName,
    required this.winPattern,
    required this.prizeAmount,
    required this.totalPlayers,
    required final List<int> winningNumbers,
    required this.completedAt,
    required this.gameDurationSeconds,
  }) : _winningNumbers = winningNumbers;

  factory _$GameResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameResultModelImplFromJson(json);

  @override
  final String gameId;
  @override
  final String winnerId;
  @override
  final String winnerName;
  @override
  final String winPattern;
  @override
  final int prizeAmount;
  @override
  final int totalPlayers;
  final List<int> _winningNumbers;
  @override
  List<int> get winningNumbers {
    if (_winningNumbers is EqualUnmodifiableListView) return _winningNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_winningNumbers);
  }

  @override
  final DateTime completedAt;
  @override
  final int gameDurationSeconds;

  @override
  String toString() {
    return 'GameResultModel(gameId: $gameId, winnerId: $winnerId, winnerName: $winnerName, winPattern: $winPattern, prizeAmount: $prizeAmount, totalPlayers: $totalPlayers, winningNumbers: $winningNumbers, completedAt: $completedAt, gameDurationSeconds: $gameDurationSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameResultModelImpl &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.winnerId, winnerId) ||
                other.winnerId == winnerId) &&
            (identical(other.winnerName, winnerName) ||
                other.winnerName == winnerName) &&
            (identical(other.winPattern, winPattern) ||
                other.winPattern == winPattern) &&
            (identical(other.prizeAmount, prizeAmount) ||
                other.prizeAmount == prizeAmount) &&
            (identical(other.totalPlayers, totalPlayers) ||
                other.totalPlayers == totalPlayers) &&
            const DeepCollectionEquality().equals(
              other._winningNumbers,
              _winningNumbers,
            ) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.gameDurationSeconds, gameDurationSeconds) ||
                other.gameDurationSeconds == gameDurationSeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    gameId,
    winnerId,
    winnerName,
    winPattern,
    prizeAmount,
    totalPlayers,
    const DeepCollectionEquality().hash(_winningNumbers),
    completedAt,
    gameDurationSeconds,
  );

  /// Create a copy of GameResultModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameResultModelImplCopyWith<_$GameResultModelImpl> get copyWith =>
      __$$GameResultModelImplCopyWithImpl<_$GameResultModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GameResultModelImplToJson(this);
  }
}

abstract class _GameResultModel implements GameResultModel {
  const factory _GameResultModel({
    required final String gameId,
    required final String winnerId,
    required final String winnerName,
    required final String winPattern,
    required final int prizeAmount,
    required final int totalPlayers,
    required final List<int> winningNumbers,
    required final DateTime completedAt,
    required final int gameDurationSeconds,
  }) = _$GameResultModelImpl;

  factory _GameResultModel.fromJson(Map<String, dynamic> json) =
      _$GameResultModelImpl.fromJson;

  @override
  String get gameId;
  @override
  String get winnerId;
  @override
  String get winnerName;
  @override
  String get winPattern;
  @override
  int get prizeAmount;
  @override
  int get totalPlayers;
  @override
  List<int> get winningNumbers;
  @override
  DateTime get completedAt;
  @override
  int get gameDurationSeconds;

  /// Create a copy of GameResultModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameResultModelImplCopyWith<_$GameResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
