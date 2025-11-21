// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bingo_game_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BingoGameDetailModel _$BingoGameDetailModelFromJson(Map<String, dynamic> json) {
  return _BingoGameDetailModel.fromJson(json);
}

/// @nodoc
mixin _$BingoGameDetailModel {
  String get gameId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get winningPattern => throw _privateConstructorUsedError;
  int get maxPlayers => throw _privateConstructorUsedError;
  int get currentPlayers => throw _privateConstructorUsedError;
  dynamic get myCard =>
      throw _privateConstructorUsedError; // still null in your API
  List<int> get calledNumbers => throw _privateConstructorUsedError;
  int get currentNumber => throw _privateConstructorUsedError;
  int get autoCallInterval => throw _privateConstructorUsedError;
  String get markingMode => throw _privateConstructorUsedError;
  int get playerEntryFee => throw _privateConstructorUsedError;
  int get profitPercentage => throw _privateConstructorUsedError;
  int get gameCost => throw _privateConstructorUsedError;
  List<BingoWinnerModel> get winners => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime get completedAt => throw _privateConstructorUsedError;
  List<int> get availableCards => throw _privateConstructorUsedError;

  /// Serializes this BingoGameDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BingoGameDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BingoGameDetailModelCopyWith<BingoGameDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BingoGameDetailModelCopyWith<$Res> {
  factory $BingoGameDetailModelCopyWith(
    BingoGameDetailModel value,
    $Res Function(BingoGameDetailModel) then,
  ) = _$BingoGameDetailModelCopyWithImpl<$Res, BingoGameDetailModel>;
  @useResult
  $Res call({
    String gameId,
    String status,
    String winningPattern,
    int maxPlayers,
    int currentPlayers,
    dynamic myCard,
    List<int> calledNumbers,
    int currentNumber,
    int autoCallInterval,
    String markingMode,
    int playerEntryFee,
    int profitPercentage,
    int gameCost,
    List<BingoWinnerModel> winners,
    DateTime startedAt,
    DateTime completedAt,
    List<int> availableCards,
  });
}

/// @nodoc
class _$BingoGameDetailModelCopyWithImpl<
  $Res,
  $Val extends BingoGameDetailModel
>
    implements $BingoGameDetailModelCopyWith<$Res> {
  _$BingoGameDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BingoGameDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? status = null,
    Object? winningPattern = null,
    Object? maxPlayers = null,
    Object? currentPlayers = null,
    Object? myCard = freezed,
    Object? calledNumbers = null,
    Object? currentNumber = null,
    Object? autoCallInterval = null,
    Object? markingMode = null,
    Object? playerEntryFee = null,
    Object? profitPercentage = null,
    Object? gameCost = null,
    Object? winners = null,
    Object? startedAt = null,
    Object? completedAt = null,
    Object? availableCards = null,
  }) {
    return _then(
      _value.copyWith(
            gameId: null == gameId
                ? _value.gameId
                : gameId // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            winningPattern: null == winningPattern
                ? _value.winningPattern
                : winningPattern // ignore: cast_nullable_to_non_nullable
                      as String,
            maxPlayers: null == maxPlayers
                ? _value.maxPlayers
                : maxPlayers // ignore: cast_nullable_to_non_nullable
                      as int,
            currentPlayers: null == currentPlayers
                ? _value.currentPlayers
                : currentPlayers // ignore: cast_nullable_to_non_nullable
                      as int,
            myCard: freezed == myCard
                ? _value.myCard
                : myCard // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            calledNumbers: null == calledNumbers
                ? _value.calledNumbers
                : calledNumbers // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            currentNumber: null == currentNumber
                ? _value.currentNumber
                : currentNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            autoCallInterval: null == autoCallInterval
                ? _value.autoCallInterval
                : autoCallInterval // ignore: cast_nullable_to_non_nullable
                      as int,
            markingMode: null == markingMode
                ? _value.markingMode
                : markingMode // ignore: cast_nullable_to_non_nullable
                      as String,
            playerEntryFee: null == playerEntryFee
                ? _value.playerEntryFee
                : playerEntryFee // ignore: cast_nullable_to_non_nullable
                      as int,
            profitPercentage: null == profitPercentage
                ? _value.profitPercentage
                : profitPercentage // ignore: cast_nullable_to_non_nullable
                      as int,
            gameCost: null == gameCost
                ? _value.gameCost
                : gameCost // ignore: cast_nullable_to_non_nullable
                      as int,
            winners: null == winners
                ? _value.winners
                : winners // ignore: cast_nullable_to_non_nullable
                      as List<BingoWinnerModel>,
            startedAt: null == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            completedAt: null == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            availableCards: null == availableCards
                ? _value.availableCards
                : availableCards // ignore: cast_nullable_to_non_nullable
                      as List<int>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BingoGameDetailModelImplCopyWith<$Res>
    implements $BingoGameDetailModelCopyWith<$Res> {
  factory _$$BingoGameDetailModelImplCopyWith(
    _$BingoGameDetailModelImpl value,
    $Res Function(_$BingoGameDetailModelImpl) then,
  ) = __$$BingoGameDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String gameId,
    String status,
    String winningPattern,
    int maxPlayers,
    int currentPlayers,
    dynamic myCard,
    List<int> calledNumbers,
    int currentNumber,
    int autoCallInterval,
    String markingMode,
    int playerEntryFee,
    int profitPercentage,
    int gameCost,
    List<BingoWinnerModel> winners,
    DateTime startedAt,
    DateTime completedAt,
    List<int> availableCards,
  });
}

/// @nodoc
class __$$BingoGameDetailModelImplCopyWithImpl<$Res>
    extends _$BingoGameDetailModelCopyWithImpl<$Res, _$BingoGameDetailModelImpl>
    implements _$$BingoGameDetailModelImplCopyWith<$Res> {
  __$$BingoGameDetailModelImplCopyWithImpl(
    _$BingoGameDetailModelImpl _value,
    $Res Function(_$BingoGameDetailModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BingoGameDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? status = null,
    Object? winningPattern = null,
    Object? maxPlayers = null,
    Object? currentPlayers = null,
    Object? myCard = freezed,
    Object? calledNumbers = null,
    Object? currentNumber = null,
    Object? autoCallInterval = null,
    Object? markingMode = null,
    Object? playerEntryFee = null,
    Object? profitPercentage = null,
    Object? gameCost = null,
    Object? winners = null,
    Object? startedAt = null,
    Object? completedAt = null,
    Object? availableCards = null,
  }) {
    return _then(
      _$BingoGameDetailModelImpl(
        gameId: null == gameId
            ? _value.gameId
            : gameId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        winningPattern: null == winningPattern
            ? _value.winningPattern
            : winningPattern // ignore: cast_nullable_to_non_nullable
                  as String,
        maxPlayers: null == maxPlayers
            ? _value.maxPlayers
            : maxPlayers // ignore: cast_nullable_to_non_nullable
                  as int,
        currentPlayers: null == currentPlayers
            ? _value.currentPlayers
            : currentPlayers // ignore: cast_nullable_to_non_nullable
                  as int,
        myCard: freezed == myCard
            ? _value.myCard
            : myCard // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        calledNumbers: null == calledNumbers
            ? _value._calledNumbers
            : calledNumbers // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        currentNumber: null == currentNumber
            ? _value.currentNumber
            : currentNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        autoCallInterval: null == autoCallInterval
            ? _value.autoCallInterval
            : autoCallInterval // ignore: cast_nullable_to_non_nullable
                  as int,
        markingMode: null == markingMode
            ? _value.markingMode
            : markingMode // ignore: cast_nullable_to_non_nullable
                  as String,
        playerEntryFee: null == playerEntryFee
            ? _value.playerEntryFee
            : playerEntryFee // ignore: cast_nullable_to_non_nullable
                  as int,
        profitPercentage: null == profitPercentage
            ? _value.profitPercentage
            : profitPercentage // ignore: cast_nullable_to_non_nullable
                  as int,
        gameCost: null == gameCost
            ? _value.gameCost
            : gameCost // ignore: cast_nullable_to_non_nullable
                  as int,
        winners: null == winners
            ? _value._winners
            : winners // ignore: cast_nullable_to_non_nullable
                  as List<BingoWinnerModel>,
        startedAt: null == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        completedAt: null == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        availableCards: null == availableCards
            ? _value._availableCards
            : availableCards // ignore: cast_nullable_to_non_nullable
                  as List<int>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BingoGameDetailModelImpl implements _BingoGameDetailModel {
  const _$BingoGameDetailModelImpl({
    required this.gameId,
    required this.status,
    required this.winningPattern,
    required this.maxPlayers,
    required this.currentPlayers,
    this.myCard,
    required final List<int> calledNumbers,
    required this.currentNumber,
    required this.autoCallInterval,
    required this.markingMode,
    required this.playerEntryFee,
    required this.profitPercentage,
    required this.gameCost,
    required final List<BingoWinnerModel> winners,
    required this.startedAt,
    required this.completedAt,
    required final List<int> availableCards,
  }) : _calledNumbers = calledNumbers,
       _winners = winners,
       _availableCards = availableCards;

  factory _$BingoGameDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BingoGameDetailModelImplFromJson(json);

  @override
  final String gameId;
  @override
  final String status;
  @override
  final String winningPattern;
  @override
  final int maxPlayers;
  @override
  final int currentPlayers;
  @override
  final dynamic myCard;
  // still null in your API
  final List<int> _calledNumbers;
  // still null in your API
  @override
  List<int> get calledNumbers {
    if (_calledNumbers is EqualUnmodifiableListView) return _calledNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_calledNumbers);
  }

  @override
  final int currentNumber;
  @override
  final int autoCallInterval;
  @override
  final String markingMode;
  @override
  final int playerEntryFee;
  @override
  final int profitPercentage;
  @override
  final int gameCost;
  final List<BingoWinnerModel> _winners;
  @override
  List<BingoWinnerModel> get winners {
    if (_winners is EqualUnmodifiableListView) return _winners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_winners);
  }

  @override
  final DateTime startedAt;
  @override
  final DateTime completedAt;
  final List<int> _availableCards;
  @override
  List<int> get availableCards {
    if (_availableCards is EqualUnmodifiableListView) return _availableCards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableCards);
  }

  @override
  String toString() {
    return 'BingoGameDetailModel(gameId: $gameId, status: $status, winningPattern: $winningPattern, maxPlayers: $maxPlayers, currentPlayers: $currentPlayers, myCard: $myCard, calledNumbers: $calledNumbers, currentNumber: $currentNumber, autoCallInterval: $autoCallInterval, markingMode: $markingMode, playerEntryFee: $playerEntryFee, profitPercentage: $profitPercentage, gameCost: $gameCost, winners: $winners, startedAt: $startedAt, completedAt: $completedAt, availableCards: $availableCards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BingoGameDetailModelImpl &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.winningPattern, winningPattern) ||
                other.winningPattern == winningPattern) &&
            (identical(other.maxPlayers, maxPlayers) ||
                other.maxPlayers == maxPlayers) &&
            (identical(other.currentPlayers, currentPlayers) ||
                other.currentPlayers == currentPlayers) &&
            const DeepCollectionEquality().equals(other.myCard, myCard) &&
            const DeepCollectionEquality().equals(
              other._calledNumbers,
              _calledNumbers,
            ) &&
            (identical(other.currentNumber, currentNumber) ||
                other.currentNumber == currentNumber) &&
            (identical(other.autoCallInterval, autoCallInterval) ||
                other.autoCallInterval == autoCallInterval) &&
            (identical(other.markingMode, markingMode) ||
                other.markingMode == markingMode) &&
            (identical(other.playerEntryFee, playerEntryFee) ||
                other.playerEntryFee == playerEntryFee) &&
            (identical(other.profitPercentage, profitPercentage) ||
                other.profitPercentage == profitPercentage) &&
            (identical(other.gameCost, gameCost) ||
                other.gameCost == gameCost) &&
            const DeepCollectionEquality().equals(other._winners, _winners) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            const DeepCollectionEquality().equals(
              other._availableCards,
              _availableCards,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    gameId,
    status,
    winningPattern,
    maxPlayers,
    currentPlayers,
    const DeepCollectionEquality().hash(myCard),
    const DeepCollectionEquality().hash(_calledNumbers),
    currentNumber,
    autoCallInterval,
    markingMode,
    playerEntryFee,
    profitPercentage,
    gameCost,
    const DeepCollectionEquality().hash(_winners),
    startedAt,
    completedAt,
    const DeepCollectionEquality().hash(_availableCards),
  );

  /// Create a copy of BingoGameDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BingoGameDetailModelImplCopyWith<_$BingoGameDetailModelImpl>
  get copyWith =>
      __$$BingoGameDetailModelImplCopyWithImpl<_$BingoGameDetailModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BingoGameDetailModelImplToJson(this);
  }
}

abstract class _BingoGameDetailModel implements BingoGameDetailModel {
  const factory _BingoGameDetailModel({
    required final String gameId,
    required final String status,
    required final String winningPattern,
    required final int maxPlayers,
    required final int currentPlayers,
    final dynamic myCard,
    required final List<int> calledNumbers,
    required final int currentNumber,
    required final int autoCallInterval,
    required final String markingMode,
    required final int playerEntryFee,
    required final int profitPercentage,
    required final int gameCost,
    required final List<BingoWinnerModel> winners,
    required final DateTime startedAt,
    required final DateTime completedAt,
    required final List<int> availableCards,
  }) = _$BingoGameDetailModelImpl;

  factory _BingoGameDetailModel.fromJson(Map<String, dynamic> json) =
      _$BingoGameDetailModelImpl.fromJson;

  @override
  String get gameId;
  @override
  String get status;
  @override
  String get winningPattern;
  @override
  int get maxPlayers;
  @override
  int get currentPlayers;
  @override
  dynamic get myCard; // still null in your API
  @override
  List<int> get calledNumbers;
  @override
  int get currentNumber;
  @override
  int get autoCallInterval;
  @override
  String get markingMode;
  @override
  int get playerEntryFee;
  @override
  int get profitPercentage;
  @override
  int get gameCost;
  @override
  List<BingoWinnerModel> get winners;
  @override
  DateTime get startedAt;
  @override
  DateTime get completedAt;
  @override
  List<int> get availableCards;

  /// Create a copy of BingoGameDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BingoGameDetailModelImplCopyWith<_$BingoGameDetailModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

BingoWinnerModel _$BingoWinnerModelFromJson(Map<String, dynamic> json) {
  return _BingoWinnerModel.fromJson(json);
}

/// @nodoc
mixin _$BingoWinnerModel {
  BingoWinnerPlayerModel get player => throw _privateConstructorUsedError;
  int get cardNumber => throw _privateConstructorUsedError;
  String get pattern => throw _privateConstructorUsedError;
  DateTime get completedAt => throw _privateConstructorUsedError;

  /// Serializes this BingoWinnerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BingoWinnerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BingoWinnerModelCopyWith<BingoWinnerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BingoWinnerModelCopyWith<$Res> {
  factory $BingoWinnerModelCopyWith(
    BingoWinnerModel value,
    $Res Function(BingoWinnerModel) then,
  ) = _$BingoWinnerModelCopyWithImpl<$Res, BingoWinnerModel>;
  @useResult
  $Res call({
    BingoWinnerPlayerModel player,
    int cardNumber,
    String pattern,
    DateTime completedAt,
  });

  $BingoWinnerPlayerModelCopyWith<$Res> get player;
}

/// @nodoc
class _$BingoWinnerModelCopyWithImpl<$Res, $Val extends BingoWinnerModel>
    implements $BingoWinnerModelCopyWith<$Res> {
  _$BingoWinnerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BingoWinnerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? cardNumber = null,
    Object? pattern = null,
    Object? completedAt = null,
  }) {
    return _then(
      _value.copyWith(
            player: null == player
                ? _value.player
                : player // ignore: cast_nullable_to_non_nullable
                      as BingoWinnerPlayerModel,
            cardNumber: null == cardNumber
                ? _value.cardNumber
                : cardNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            pattern: null == pattern
                ? _value.pattern
                : pattern // ignore: cast_nullable_to_non_nullable
                      as String,
            completedAt: null == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of BingoWinnerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BingoWinnerPlayerModelCopyWith<$Res> get player {
    return $BingoWinnerPlayerModelCopyWith<$Res>(_value.player, (value) {
      return _then(_value.copyWith(player: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BingoWinnerModelImplCopyWith<$Res>
    implements $BingoWinnerModelCopyWith<$Res> {
  factory _$$BingoWinnerModelImplCopyWith(
    _$BingoWinnerModelImpl value,
    $Res Function(_$BingoWinnerModelImpl) then,
  ) = __$$BingoWinnerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    BingoWinnerPlayerModel player,
    int cardNumber,
    String pattern,
    DateTime completedAt,
  });

  @override
  $BingoWinnerPlayerModelCopyWith<$Res> get player;
}

/// @nodoc
class __$$BingoWinnerModelImplCopyWithImpl<$Res>
    extends _$BingoWinnerModelCopyWithImpl<$Res, _$BingoWinnerModelImpl>
    implements _$$BingoWinnerModelImplCopyWith<$Res> {
  __$$BingoWinnerModelImplCopyWithImpl(
    _$BingoWinnerModelImpl _value,
    $Res Function(_$BingoWinnerModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BingoWinnerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? cardNumber = null,
    Object? pattern = null,
    Object? completedAt = null,
  }) {
    return _then(
      _$BingoWinnerModelImpl(
        player: null == player
            ? _value.player
            : player // ignore: cast_nullable_to_non_nullable
                  as BingoWinnerPlayerModel,
        cardNumber: null == cardNumber
            ? _value.cardNumber
            : cardNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        pattern: null == pattern
            ? _value.pattern
            : pattern // ignore: cast_nullable_to_non_nullable
                  as String,
        completedAt: null == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BingoWinnerModelImpl implements _BingoWinnerModel {
  const _$BingoWinnerModelImpl({
    required this.player,
    required this.cardNumber,
    required this.pattern,
    required this.completedAt,
  });

  factory _$BingoWinnerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BingoWinnerModelImplFromJson(json);

  @override
  final BingoWinnerPlayerModel player;
  @override
  final int cardNumber;
  @override
  final String pattern;
  @override
  final DateTime completedAt;

  @override
  String toString() {
    return 'BingoWinnerModel(player: $player, cardNumber: $cardNumber, pattern: $pattern, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BingoWinnerModelImpl &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.pattern, pattern) || other.pattern == pattern) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, player, cardNumber, pattern, completedAt);

  /// Create a copy of BingoWinnerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BingoWinnerModelImplCopyWith<_$BingoWinnerModelImpl> get copyWith =>
      __$$BingoWinnerModelImplCopyWithImpl<_$BingoWinnerModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BingoWinnerModelImplToJson(this);
  }
}

abstract class _BingoWinnerModel implements BingoWinnerModel {
  const factory _BingoWinnerModel({
    required final BingoWinnerPlayerModel player,
    required final int cardNumber,
    required final String pattern,
    required final DateTime completedAt,
  }) = _$BingoWinnerModelImpl;

  factory _BingoWinnerModel.fromJson(Map<String, dynamic> json) =
      _$BingoWinnerModelImpl.fromJson;

  @override
  BingoWinnerPlayerModel get player;
  @override
  int get cardNumber;
  @override
  String get pattern;
  @override
  DateTime get completedAt;

  /// Create a copy of BingoWinnerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BingoWinnerModelImplCopyWith<_$BingoWinnerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BingoWinnerPlayerModel _$BingoWinnerPlayerModelFromJson(
  Map<String, dynamic> json,
) {
  return _BingoWinnerPlayerModel.fromJson(json);
}

/// @nodoc
mixin _$BingoWinnerPlayerModel {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  /// Serializes this BingoWinnerPlayerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BingoWinnerPlayerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BingoWinnerPlayerModelCopyWith<BingoWinnerPlayerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BingoWinnerPlayerModelCopyWith<$Res> {
  factory $BingoWinnerPlayerModelCopyWith(
    BingoWinnerPlayerModel value,
    $Res Function(BingoWinnerPlayerModel) then,
  ) = _$BingoWinnerPlayerModelCopyWithImpl<$Res, BingoWinnerPlayerModel>;
  @useResult
  $Res call({@JsonKey(name: "_id") String id, String username});
}

/// @nodoc
class _$BingoWinnerPlayerModelCopyWithImpl<
  $Res,
  $Val extends BingoWinnerPlayerModel
>
    implements $BingoWinnerPlayerModelCopyWith<$Res> {
  _$BingoWinnerPlayerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BingoWinnerPlayerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? username = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BingoWinnerPlayerModelImplCopyWith<$Res>
    implements $BingoWinnerPlayerModelCopyWith<$Res> {
  factory _$$BingoWinnerPlayerModelImplCopyWith(
    _$BingoWinnerPlayerModelImpl value,
    $Res Function(_$BingoWinnerPlayerModelImpl) then,
  ) = __$$BingoWinnerPlayerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "_id") String id, String username});
}

/// @nodoc
class __$$BingoWinnerPlayerModelImplCopyWithImpl<$Res>
    extends
        _$BingoWinnerPlayerModelCopyWithImpl<$Res, _$BingoWinnerPlayerModelImpl>
    implements _$$BingoWinnerPlayerModelImplCopyWith<$Res> {
  __$$BingoWinnerPlayerModelImplCopyWithImpl(
    _$BingoWinnerPlayerModelImpl _value,
    $Res Function(_$BingoWinnerPlayerModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BingoWinnerPlayerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? username = null}) {
    return _then(
      _$BingoWinnerPlayerModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BingoWinnerPlayerModelImpl implements _BingoWinnerPlayerModel {
  const _$BingoWinnerPlayerModelImpl({
    @JsonKey(name: "_id") required this.id,
    required this.username,
  });

  factory _$BingoWinnerPlayerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BingoWinnerPlayerModelImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final String username;

  @override
  String toString() {
    return 'BingoWinnerPlayerModel(id: $id, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BingoWinnerPlayerModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, username);

  /// Create a copy of BingoWinnerPlayerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BingoWinnerPlayerModelImplCopyWith<_$BingoWinnerPlayerModelImpl>
  get copyWith =>
      __$$BingoWinnerPlayerModelImplCopyWithImpl<_$BingoWinnerPlayerModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BingoWinnerPlayerModelImplToJson(this);
  }
}

abstract class _BingoWinnerPlayerModel implements BingoWinnerPlayerModel {
  const factory _BingoWinnerPlayerModel({
    @JsonKey(name: "_id") required final String id,
    required final String username,
  }) = _$BingoWinnerPlayerModelImpl;

  factory _BingoWinnerPlayerModel.fromJson(Map<String, dynamic> json) =
      _$BingoWinnerPlayerModelImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get username;

  /// Create a copy of BingoWinnerPlayerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BingoWinnerPlayerModelImplCopyWith<_$BingoWinnerPlayerModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
