// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bingo_game_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BingoGameModel _$BingoGameModelFromJson(Map<String, dynamic> json) {
  return _BingoGameModel.fromJson(json);
}

/// @nodoc
mixin _$BingoGameModel {
  @JsonKey(name: '_id', defaultValue: "")
  String get id => throw _privateConstructorUsedError;
  String get gameId => throw _privateConstructorUsedError;
  String? get gamePin => throw _privateConstructorUsedError;
  int get maxPlayers => throw _privateConstructorUsedError;
  int get currentPlayers => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // preparing, ready, active, paused, completed
  String get winningPattern => throw _privateConstructorUsedError;
  int get autoCallInterval => throw _privateConstructorUsedError;
  String? get markingMode =>
      throw _privateConstructorUsedError; // auto, manual - optional since not in all responses
  int? get gameCost => throw _privateConstructorUsedError;
  int? get profitPercentage => throw _privateConstructorUsedError;
  double? get playerEntryFee => throw _privateConstructorUsedError;
  List<dynamic> get players =>
      throw _privateConstructorUsedError; // Can be String IDs or objects
  List<BingoCardModel> get bingoCards => throw _privateConstructorUsedError;
  List<int> get calledNumbers => throw _privateConstructorUsedError;
  List<int> get availableCards => throw _privateConstructorUsedError;
  int? get currentNumber => throw _privateConstructorUsedError;
  List<WinnerModel> get winners => throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  DateTime? get startedAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int? get calledNumbersCount => throw _privateConstructorUsedError;
  bool? get hasWinner => throw _privateConstructorUsedError;

  /// Serializes this BingoGameModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BingoGameModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BingoGameModelCopyWith<BingoGameModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BingoGameModelCopyWith<$Res> {
  factory $BingoGameModelCopyWith(
    BingoGameModel value,
    $Res Function(BingoGameModel) then,
  ) = _$BingoGameModelCopyWithImpl<$Res, BingoGameModel>;
  @useResult
  $Res call({
    @JsonKey(name: '_id', defaultValue: "") String id,
    String gameId,
    String? gamePin,
    int maxPlayers,
    int currentPlayers,
    String status,
    String winningPattern,
    int autoCallInterval,
    String? markingMode,
    int? gameCost,
    int? profitPercentage,
    double? playerEntryFee,
    List<dynamic> players,
    List<BingoCardModel> bingoCards,
    List<int> calledNumbers,
    List<int> availableCards,
    int? currentNumber,
    List<WinnerModel> winners,
    String createdBy,
    DateTime? startedAt,
    DateTime? completedAt,
    DateTime createdAt,
    int? calledNumbersCount,
    bool? hasWinner,
  });
}

/// @nodoc
class _$BingoGameModelCopyWithImpl<$Res, $Val extends BingoGameModel>
    implements $BingoGameModelCopyWith<$Res> {
  _$BingoGameModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BingoGameModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gameId = null,
    Object? gamePin = freezed,
    Object? maxPlayers = null,
    Object? currentPlayers = null,
    Object? status = null,
    Object? winningPattern = null,
    Object? autoCallInterval = null,
    Object? markingMode = freezed,
    Object? gameCost = freezed,
    Object? profitPercentage = freezed,
    Object? playerEntryFee = freezed,
    Object? players = null,
    Object? bingoCards = null,
    Object? calledNumbers = null,
    Object? availableCards = null,
    Object? currentNumber = freezed,
    Object? winners = null,
    Object? createdBy = null,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? createdAt = null,
    Object? calledNumbersCount = freezed,
    Object? hasWinner = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            gameId: null == gameId
                ? _value.gameId
                : gameId // ignore: cast_nullable_to_non_nullable
                      as String,
            gamePin: freezed == gamePin
                ? _value.gamePin
                : gamePin // ignore: cast_nullable_to_non_nullable
                      as String?,
            maxPlayers: null == maxPlayers
                ? _value.maxPlayers
                : maxPlayers // ignore: cast_nullable_to_non_nullable
                      as int,
            currentPlayers: null == currentPlayers
                ? _value.currentPlayers
                : currentPlayers // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            winningPattern: null == winningPattern
                ? _value.winningPattern
                : winningPattern // ignore: cast_nullable_to_non_nullable
                      as String,
            autoCallInterval: null == autoCallInterval
                ? _value.autoCallInterval
                : autoCallInterval // ignore: cast_nullable_to_non_nullable
                      as int,
            markingMode: freezed == markingMode
                ? _value.markingMode
                : markingMode // ignore: cast_nullable_to_non_nullable
                      as String?,
            gameCost: freezed == gameCost
                ? _value.gameCost
                : gameCost // ignore: cast_nullable_to_non_nullable
                      as int?,
            profitPercentage: freezed == profitPercentage
                ? _value.profitPercentage
                : profitPercentage // ignore: cast_nullable_to_non_nullable
                      as int?,
            playerEntryFee: freezed == playerEntryFee
                ? _value.playerEntryFee
                : playerEntryFee // ignore: cast_nullable_to_non_nullable
                      as double?,
            players: null == players
                ? _value.players
                : players // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>,
            bingoCards: null == bingoCards
                ? _value.bingoCards
                : bingoCards // ignore: cast_nullable_to_non_nullable
                      as List<BingoCardModel>,
            calledNumbers: null == calledNumbers
                ? _value.calledNumbers
                : calledNumbers // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            availableCards: null == availableCards
                ? _value.availableCards
                : availableCards // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            currentNumber: freezed == currentNumber
                ? _value.currentNumber
                : currentNumber // ignore: cast_nullable_to_non_nullable
                      as int?,
            winners: null == winners
                ? _value.winners
                : winners // ignore: cast_nullable_to_non_nullable
                      as List<WinnerModel>,
            createdBy: null == createdBy
                ? _value.createdBy
                : createdBy // ignore: cast_nullable_to_non_nullable
                      as String,
            startedAt: freezed == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            calledNumbersCount: freezed == calledNumbersCount
                ? _value.calledNumbersCount
                : calledNumbersCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            hasWinner: freezed == hasWinner
                ? _value.hasWinner
                : hasWinner // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BingoGameModelImplCopyWith<$Res>
    implements $BingoGameModelCopyWith<$Res> {
  factory _$$BingoGameModelImplCopyWith(
    _$BingoGameModelImpl value,
    $Res Function(_$BingoGameModelImpl) then,
  ) = __$$BingoGameModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id', defaultValue: "") String id,
    String gameId,
    String? gamePin,
    int maxPlayers,
    int currentPlayers,
    String status,
    String winningPattern,
    int autoCallInterval,
    String? markingMode,
    int? gameCost,
    int? profitPercentage,
    double? playerEntryFee,
    List<dynamic> players,
    List<BingoCardModel> bingoCards,
    List<int> calledNumbers,
    List<int> availableCards,
    int? currentNumber,
    List<WinnerModel> winners,
    String createdBy,
    DateTime? startedAt,
    DateTime? completedAt,
    DateTime createdAt,
    int? calledNumbersCount,
    bool? hasWinner,
  });
}

/// @nodoc
class __$$BingoGameModelImplCopyWithImpl<$Res>
    extends _$BingoGameModelCopyWithImpl<$Res, _$BingoGameModelImpl>
    implements _$$BingoGameModelImplCopyWith<$Res> {
  __$$BingoGameModelImplCopyWithImpl(
    _$BingoGameModelImpl _value,
    $Res Function(_$BingoGameModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BingoGameModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gameId = null,
    Object? gamePin = freezed,
    Object? maxPlayers = null,
    Object? currentPlayers = null,
    Object? status = null,
    Object? winningPattern = null,
    Object? autoCallInterval = null,
    Object? markingMode = freezed,
    Object? gameCost = freezed,
    Object? profitPercentage = freezed,
    Object? playerEntryFee = freezed,
    Object? players = null,
    Object? bingoCards = null,
    Object? calledNumbers = null,
    Object? availableCards = null,
    Object? currentNumber = freezed,
    Object? winners = null,
    Object? createdBy = null,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? createdAt = null,
    Object? calledNumbersCount = freezed,
    Object? hasWinner = freezed,
  }) {
    return _then(
      _$BingoGameModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        gameId: null == gameId
            ? _value.gameId
            : gameId // ignore: cast_nullable_to_non_nullable
                  as String,
        gamePin: freezed == gamePin
            ? _value.gamePin
            : gamePin // ignore: cast_nullable_to_non_nullable
                  as String?,
        maxPlayers: null == maxPlayers
            ? _value.maxPlayers
            : maxPlayers // ignore: cast_nullable_to_non_nullable
                  as int,
        currentPlayers: null == currentPlayers
            ? _value.currentPlayers
            : currentPlayers // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        winningPattern: null == winningPattern
            ? _value.winningPattern
            : winningPattern // ignore: cast_nullable_to_non_nullable
                  as String,
        autoCallInterval: null == autoCallInterval
            ? _value.autoCallInterval
            : autoCallInterval // ignore: cast_nullable_to_non_nullable
                  as int,
        markingMode: freezed == markingMode
            ? _value.markingMode
            : markingMode // ignore: cast_nullable_to_non_nullable
                  as String?,
        gameCost: freezed == gameCost
            ? _value.gameCost
            : gameCost // ignore: cast_nullable_to_non_nullable
                  as int?,
        profitPercentage: freezed == profitPercentage
            ? _value.profitPercentage
            : profitPercentage // ignore: cast_nullable_to_non_nullable
                  as int?,
        playerEntryFee: freezed == playerEntryFee
            ? _value.playerEntryFee
            : playerEntryFee // ignore: cast_nullable_to_non_nullable
                  as double?,
        players: null == players
            ? _value._players
            : players // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
        bingoCards: null == bingoCards
            ? _value._bingoCards
            : bingoCards // ignore: cast_nullable_to_non_nullable
                  as List<BingoCardModel>,
        calledNumbers: null == calledNumbers
            ? _value._calledNumbers
            : calledNumbers // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        availableCards: null == availableCards
            ? _value._availableCards
            : availableCards // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        currentNumber: freezed == currentNumber
            ? _value.currentNumber
            : currentNumber // ignore: cast_nullable_to_non_nullable
                  as int?,
        winners: null == winners
            ? _value._winners
            : winners // ignore: cast_nullable_to_non_nullable
                  as List<WinnerModel>,
        createdBy: null == createdBy
            ? _value.createdBy
            : createdBy // ignore: cast_nullable_to_non_nullable
                  as String,
        startedAt: freezed == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        calledNumbersCount: freezed == calledNumbersCount
            ? _value.calledNumbersCount
            : calledNumbersCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        hasWinner: freezed == hasWinner
            ? _value.hasWinner
            : hasWinner // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BingoGameModelImpl implements _BingoGameModel {
  const _$BingoGameModelImpl({
    @JsonKey(name: '_id', defaultValue: "") required this.id,
    required this.gameId,
    this.gamePin,
    required this.maxPlayers,
    required this.currentPlayers,
    required this.status,
    required this.winningPattern,
    required this.autoCallInterval,
    this.markingMode,
    this.gameCost,
    this.profitPercentage,
    this.playerEntryFee,
    final List<dynamic> players = const [],
    final List<BingoCardModel> bingoCards = const [],
    final List<int> calledNumbers = const [],
    final List<int> availableCards = const [],
    this.currentNumber,
    final List<WinnerModel> winners = const [],
    required this.createdBy,
    this.startedAt,
    this.completedAt,
    required this.createdAt,
    this.calledNumbersCount,
    this.hasWinner,
  }) : _players = players,
       _bingoCards = bingoCards,
       _calledNumbers = calledNumbers,
       _availableCards = availableCards,
       _winners = winners;

  factory _$BingoGameModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BingoGameModelImplFromJson(json);

  @override
  @JsonKey(name: '_id', defaultValue: "")
  final String id;
  @override
  final String gameId;
  @override
  final String? gamePin;
  @override
  final int maxPlayers;
  @override
  final int currentPlayers;
  @override
  final String status;
  // preparing, ready, active, paused, completed
  @override
  final String winningPattern;
  @override
  final int autoCallInterval;
  @override
  final String? markingMode;
  // auto, manual - optional since not in all responses
  @override
  final int? gameCost;
  @override
  final int? profitPercentage;
  @override
  final double? playerEntryFee;
  final List<dynamic> _players;
  @override
  @JsonKey()
  List<dynamic> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

  // Can be String IDs or objects
  final List<BingoCardModel> _bingoCards;
  // Can be String IDs or objects
  @override
  @JsonKey()
  List<BingoCardModel> get bingoCards {
    if (_bingoCards is EqualUnmodifiableListView) return _bingoCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bingoCards);
  }

  final List<int> _calledNumbers;
  @override
  @JsonKey()
  List<int> get calledNumbers {
    if (_calledNumbers is EqualUnmodifiableListView) return _calledNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_calledNumbers);
  }

  final List<int> _availableCards;
  @override
  @JsonKey()
  List<int> get availableCards {
    if (_availableCards is EqualUnmodifiableListView) return _availableCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableCards);
  }

  @override
  final int? currentNumber;
  final List<WinnerModel> _winners;
  @override
  @JsonKey()
  List<WinnerModel> get winners {
    if (_winners is EqualUnmodifiableListView) return _winners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_winners);
  }

  @override
  final String createdBy;
  @override
  final DateTime? startedAt;
  @override
  final DateTime? completedAt;
  @override
  final DateTime createdAt;
  @override
  final int? calledNumbersCount;
  @override
  final bool? hasWinner;

  @override
  String toString() {
    return 'BingoGameModel(id: $id, gameId: $gameId, gamePin: $gamePin, maxPlayers: $maxPlayers, currentPlayers: $currentPlayers, status: $status, winningPattern: $winningPattern, autoCallInterval: $autoCallInterval, markingMode: $markingMode, gameCost: $gameCost, profitPercentage: $profitPercentage, playerEntryFee: $playerEntryFee, players: $players, bingoCards: $bingoCards, calledNumbers: $calledNumbers, availableCards: $availableCards, currentNumber: $currentNumber, winners: $winners, createdBy: $createdBy, startedAt: $startedAt, completedAt: $completedAt, createdAt: $createdAt, calledNumbersCount: $calledNumbersCount, hasWinner: $hasWinner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BingoGameModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.gamePin, gamePin) || other.gamePin == gamePin) &&
            (identical(other.maxPlayers, maxPlayers) ||
                other.maxPlayers == maxPlayers) &&
            (identical(other.currentPlayers, currentPlayers) ||
                other.currentPlayers == currentPlayers) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.winningPattern, winningPattern) ||
                other.winningPattern == winningPattern) &&
            (identical(other.autoCallInterval, autoCallInterval) ||
                other.autoCallInterval == autoCallInterval) &&
            (identical(other.markingMode, markingMode) ||
                other.markingMode == markingMode) &&
            (identical(other.gameCost, gameCost) ||
                other.gameCost == gameCost) &&
            (identical(other.profitPercentage, profitPercentage) ||
                other.profitPercentage == profitPercentage) &&
            (identical(other.playerEntryFee, playerEntryFee) ||
                other.playerEntryFee == playerEntryFee) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            const DeepCollectionEquality().equals(
              other._bingoCards,
              _bingoCards,
            ) &&
            const DeepCollectionEquality().equals(
              other._calledNumbers,
              _calledNumbers,
            ) &&
            const DeepCollectionEquality().equals(
              other._availableCards,
              _availableCards,
            ) &&
            (identical(other.currentNumber, currentNumber) ||
                other.currentNumber == currentNumber) &&
            const DeepCollectionEquality().equals(other._winners, _winners) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.calledNumbersCount, calledNumbersCount) ||
                other.calledNumbersCount == calledNumbersCount) &&
            (identical(other.hasWinner, hasWinner) ||
                other.hasWinner == hasWinner));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    gameId,
    gamePin,
    maxPlayers,
    currentPlayers,
    status,
    winningPattern,
    autoCallInterval,
    markingMode,
    gameCost,
    profitPercentage,
    playerEntryFee,
    const DeepCollectionEquality().hash(_players),
    const DeepCollectionEquality().hash(_bingoCards),
    const DeepCollectionEquality().hash(_calledNumbers),
    const DeepCollectionEquality().hash(_availableCards),
    currentNumber,
    const DeepCollectionEquality().hash(_winners),
    createdBy,
    startedAt,
    completedAt,
    createdAt,
    calledNumbersCount,
    hasWinner,
  ]);

  /// Create a copy of BingoGameModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BingoGameModelImplCopyWith<_$BingoGameModelImpl> get copyWith =>
      __$$BingoGameModelImplCopyWithImpl<_$BingoGameModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BingoGameModelImplToJson(this);
  }
}

abstract class _BingoGameModel implements BingoGameModel {
  const factory _BingoGameModel({
    @JsonKey(name: '_id', defaultValue: "") required final String id,
    required final String gameId,
    final String? gamePin,
    required final int maxPlayers,
    required final int currentPlayers,
    required final String status,
    required final String winningPattern,
    required final int autoCallInterval,
    final String? markingMode,
    final int? gameCost,
    final int? profitPercentage,
    final double? playerEntryFee,
    final List<dynamic> players,
    final List<BingoCardModel> bingoCards,
    final List<int> calledNumbers,
    final List<int> availableCards,
    final int? currentNumber,
    final List<WinnerModel> winners,
    required final String createdBy,
    final DateTime? startedAt,
    final DateTime? completedAt,
    required final DateTime createdAt,
    final int? calledNumbersCount,
    final bool? hasWinner,
  }) = _$BingoGameModelImpl;

  factory _BingoGameModel.fromJson(Map<String, dynamic> json) =
      _$BingoGameModelImpl.fromJson;

  @override
  @JsonKey(name: '_id', defaultValue: "")
  String get id;
  @override
  String get gameId;
  @override
  String? get gamePin;
  @override
  int get maxPlayers;
  @override
  int get currentPlayers;
  @override
  String get status; // preparing, ready, active, paused, completed
  @override
  String get winningPattern;
  @override
  int get autoCallInterval;
  @override
  String? get markingMode; // auto, manual - optional since not in all responses
  @override
  int? get gameCost;
  @override
  int? get profitPercentage;
  @override
  double? get playerEntryFee;
  @override
  List<dynamic> get players; // Can be String IDs or objects
  @override
  List<BingoCardModel> get bingoCards;
  @override
  List<int> get calledNumbers;
  @override
  List<int> get availableCards;
  @override
  int? get currentNumber;
  @override
  List<WinnerModel> get winners;
  @override
  String get createdBy;
  @override
  DateTime? get startedAt;
  @override
  DateTime? get completedAt;
  @override
  DateTime get createdAt;
  @override
  int? get calledNumbersCount;
  @override
  bool? get hasWinner;

  /// Create a copy of BingoGameModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BingoGameModelImplCopyWith<_$BingoGameModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
