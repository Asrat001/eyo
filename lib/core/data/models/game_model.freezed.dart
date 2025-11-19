// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GameModel _$GameModelFromJson(Map<String, dynamic> json) {
  return _GameModel.fromJson(json);
}

/// @nodoc
mixin _$GameModel {
  String get id => throw _privateConstructorUsedError;
  String get pin => throw _privateConstructorUsedError;
  String get hostId => throw _privateConstructorUsedError;
  List<String> get playerIds => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get winPattern => throw _privateConstructorUsedError;
  int get maxPlayers => throw _privateConstructorUsedError;
  int get entryFee => throw _privateConstructorUsedError;
  int get prizePool => throw _privateConstructorUsedError;
  List<int> get calledNumbers => throw _privateConstructorUsedError;
  String? get winnerId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get endedAt => throw _privateConstructorUsedError;
  int get numberCallInterval => throw _privateConstructorUsedError;

  /// Serializes this GameModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameModelCopyWith<GameModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameModelCopyWith<$Res> {
  factory $GameModelCopyWith(GameModel value, $Res Function(GameModel) then) =
      _$GameModelCopyWithImpl<$Res, GameModel>;
  @useResult
  $Res call({
    String id,
    String pin,
    String hostId,
    List<String> playerIds,
    String status,
    String winPattern,
    int maxPlayers,
    int entryFee,
    int prizePool,
    List<int> calledNumbers,
    String? winnerId,
    DateTime createdAt,
    DateTime? startedAt,
    DateTime? endedAt,
    int numberCallInterval,
  });
}

/// @nodoc
class _$GameModelCopyWithImpl<$Res, $Val extends GameModel>
    implements $GameModelCopyWith<$Res> {
  _$GameModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pin = null,
    Object? hostId = null,
    Object? playerIds = null,
    Object? status = null,
    Object? winPattern = null,
    Object? maxPlayers = null,
    Object? entryFee = null,
    Object? prizePool = null,
    Object? calledNumbers = null,
    Object? winnerId = freezed,
    Object? createdAt = null,
    Object? startedAt = freezed,
    Object? endedAt = freezed,
    Object? numberCallInterval = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            pin: null == pin
                ? _value.pin
                : pin // ignore: cast_nullable_to_non_nullable
                      as String,
            hostId: null == hostId
                ? _value.hostId
                : hostId // ignore: cast_nullable_to_non_nullable
                      as String,
            playerIds: null == playerIds
                ? _value.playerIds
                : playerIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            winPattern: null == winPattern
                ? _value.winPattern
                : winPattern // ignore: cast_nullable_to_non_nullable
                      as String,
            maxPlayers: null == maxPlayers
                ? _value.maxPlayers
                : maxPlayers // ignore: cast_nullable_to_non_nullable
                      as int,
            entryFee: null == entryFee
                ? _value.entryFee
                : entryFee // ignore: cast_nullable_to_non_nullable
                      as int,
            prizePool: null == prizePool
                ? _value.prizePool
                : prizePool // ignore: cast_nullable_to_non_nullable
                      as int,
            calledNumbers: null == calledNumbers
                ? _value.calledNumbers
                : calledNumbers // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            winnerId: freezed == winnerId
                ? _value.winnerId
                : winnerId // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            startedAt: freezed == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            endedAt: freezed == endedAt
                ? _value.endedAt
                : endedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            numberCallInterval: null == numberCallInterval
                ? _value.numberCallInterval
                : numberCallInterval // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GameModelImplCopyWith<$Res>
    implements $GameModelCopyWith<$Res> {
  factory _$$GameModelImplCopyWith(
    _$GameModelImpl value,
    $Res Function(_$GameModelImpl) then,
  ) = __$$GameModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String pin,
    String hostId,
    List<String> playerIds,
    String status,
    String winPattern,
    int maxPlayers,
    int entryFee,
    int prizePool,
    List<int> calledNumbers,
    String? winnerId,
    DateTime createdAt,
    DateTime? startedAt,
    DateTime? endedAt,
    int numberCallInterval,
  });
}

/// @nodoc
class __$$GameModelImplCopyWithImpl<$Res>
    extends _$GameModelCopyWithImpl<$Res, _$GameModelImpl>
    implements _$$GameModelImplCopyWith<$Res> {
  __$$GameModelImplCopyWithImpl(
    _$GameModelImpl _value,
    $Res Function(_$GameModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? pin = null,
    Object? hostId = null,
    Object? playerIds = null,
    Object? status = null,
    Object? winPattern = null,
    Object? maxPlayers = null,
    Object? entryFee = null,
    Object? prizePool = null,
    Object? calledNumbers = null,
    Object? winnerId = freezed,
    Object? createdAt = null,
    Object? startedAt = freezed,
    Object? endedAt = freezed,
    Object? numberCallInterval = null,
  }) {
    return _then(
      _$GameModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        pin: null == pin
            ? _value.pin
            : pin // ignore: cast_nullable_to_non_nullable
                  as String,
        hostId: null == hostId
            ? _value.hostId
            : hostId // ignore: cast_nullable_to_non_nullable
                  as String,
        playerIds: null == playerIds
            ? _value._playerIds
            : playerIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        winPattern: null == winPattern
            ? _value.winPattern
            : winPattern // ignore: cast_nullable_to_non_nullable
                  as String,
        maxPlayers: null == maxPlayers
            ? _value.maxPlayers
            : maxPlayers // ignore: cast_nullable_to_non_nullable
                  as int,
        entryFee: null == entryFee
            ? _value.entryFee
            : entryFee // ignore: cast_nullable_to_non_nullable
                  as int,
        prizePool: null == prizePool
            ? _value.prizePool
            : prizePool // ignore: cast_nullable_to_non_nullable
                  as int,
        calledNumbers: null == calledNumbers
            ? _value._calledNumbers
            : calledNumbers // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        winnerId: freezed == winnerId
            ? _value.winnerId
            : winnerId // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        startedAt: freezed == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endedAt: freezed == endedAt
            ? _value.endedAt
            : endedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        numberCallInterval: null == numberCallInterval
            ? _value.numberCallInterval
            : numberCallInterval // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GameModelImpl implements _GameModel {
  const _$GameModelImpl({
    required this.id,
    required this.pin,
    required this.hostId,
    final List<String> playerIds = const [],
    this.status = 'waiting',
    this.winPattern = 'anyLine',
    this.maxPlayers = 50,
    this.entryFee = 0,
    this.prizePool = 0,
    final List<int> calledNumbers = const [],
    this.winnerId,
    required this.createdAt,
    this.startedAt,
    this.endedAt,
    this.numberCallInterval = 3,
  }) : _playerIds = playerIds,
       _calledNumbers = calledNumbers;

  factory _$GameModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameModelImplFromJson(json);

  @override
  final String id;
  @override
  final String pin;
  @override
  final String hostId;
  final List<String> _playerIds;
  @override
  @JsonKey()
  List<String> get playerIds {
    if (_playerIds is EqualUnmodifiableListView) return _playerIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playerIds);
  }

  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String winPattern;
  @override
  @JsonKey()
  final int maxPlayers;
  @override
  @JsonKey()
  final int entryFee;
  @override
  @JsonKey()
  final int prizePool;
  final List<int> _calledNumbers;
  @override
  @JsonKey()
  List<int> get calledNumbers {
    if (_calledNumbers is EqualUnmodifiableListView) return _calledNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_calledNumbers);
  }

  @override
  final String? winnerId;
  @override
  final DateTime createdAt;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? endedAt;
  @override
  @JsonKey()
  final int numberCallInterval;

  @override
  String toString() {
    return 'GameModel(id: $id, pin: $pin, hostId: $hostId, playerIds: $playerIds, status: $status, winPattern: $winPattern, maxPlayers: $maxPlayers, entryFee: $entryFee, prizePool: $prizePool, calledNumbers: $calledNumbers, winnerId: $winnerId, createdAt: $createdAt, startedAt: $startedAt, endedAt: $endedAt, numberCallInterval: $numberCallInterval)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pin, pin) || other.pin == pin) &&
            (identical(other.hostId, hostId) || other.hostId == hostId) &&
            const DeepCollectionEquality().equals(
              other._playerIds,
              _playerIds,
            ) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.winPattern, winPattern) ||
                other.winPattern == winPattern) &&
            (identical(other.maxPlayers, maxPlayers) ||
                other.maxPlayers == maxPlayers) &&
            (identical(other.entryFee, entryFee) ||
                other.entryFee == entryFee) &&
            (identical(other.prizePool, prizePool) ||
                other.prizePool == prizePool) &&
            const DeepCollectionEquality().equals(
              other._calledNumbers,
              _calledNumbers,
            ) &&
            (identical(other.winnerId, winnerId) ||
                other.winnerId == winnerId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt) &&
            (identical(other.numberCallInterval, numberCallInterval) ||
                other.numberCallInterval == numberCallInterval));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    pin,
    hostId,
    const DeepCollectionEquality().hash(_playerIds),
    status,
    winPattern,
    maxPlayers,
    entryFee,
    prizePool,
    const DeepCollectionEquality().hash(_calledNumbers),
    winnerId,
    createdAt,
    startedAt,
    endedAt,
    numberCallInterval,
  );

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameModelImplCopyWith<_$GameModelImpl> get copyWith =>
      __$$GameModelImplCopyWithImpl<_$GameModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameModelImplToJson(this);
  }
}

abstract class _GameModel implements GameModel {
  const factory _GameModel({
    required final String id,
    required final String pin,
    required final String hostId,
    final List<String> playerIds,
    final String status,
    final String winPattern,
    final int maxPlayers,
    final int entryFee,
    final int prizePool,
    final List<int> calledNumbers,
    final String? winnerId,
    required final DateTime createdAt,
    final DateTime? startedAt,
    final DateTime? endedAt,
    final int numberCallInterval,
  }) = _$GameModelImpl;

  factory _GameModel.fromJson(Map<String, dynamic> json) =
      _$GameModelImpl.fromJson;

  @override
  String get id;
  @override
  String get pin;
  @override
  String get hostId;
  @override
  List<String> get playerIds;
  @override
  String get status;
  @override
  String get winPattern;
  @override
  int get maxPlayers;
  @override
  int get entryFee;
  @override
  int get prizePool;
  @override
  List<int> get calledNumbers;
  @override
  String? get winnerId;
  @override
  DateTime get createdAt;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get endedAt;
  @override
  int get numberCallInterval;

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameModelImplCopyWith<_$GameModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
