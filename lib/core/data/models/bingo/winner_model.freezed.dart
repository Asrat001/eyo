// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'winner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WinnerModel _$WinnerModelFromJson(Map<String, dynamic> json) {
  return _WinnerModel.fromJson(json);
}

/// @nodoc
mixin _$WinnerModel {
  String get playerId => throw _privateConstructorUsedError;
  String get playerName => throw _privateConstructorUsedError;
  int get cardNumber => throw _privateConstructorUsedError;
  String get pattern => throw _privateConstructorUsedError;
  DateTime get completedAt => throw _privateConstructorUsedError;
  List<List<int>> get winningCard => throw _privateConstructorUsedError;
  List<List<bool>> get markedCells => throw _privateConstructorUsedError;

  /// Serializes this WinnerModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WinnerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WinnerModelCopyWith<WinnerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WinnerModelCopyWith<$Res> {
  factory $WinnerModelCopyWith(
    WinnerModel value,
    $Res Function(WinnerModel) then,
  ) = _$WinnerModelCopyWithImpl<$Res, WinnerModel>;
  @useResult
  $Res call({
    String playerId,
    String playerName,
    int cardNumber,
    String pattern,
    DateTime completedAt,
    List<List<int>> winningCard,
    List<List<bool>> markedCells,
  });
}

/// @nodoc
class _$WinnerModelCopyWithImpl<$Res, $Val extends WinnerModel>
    implements $WinnerModelCopyWith<$Res> {
  _$WinnerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WinnerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? playerName = null,
    Object? cardNumber = null,
    Object? pattern = null,
    Object? completedAt = null,
    Object? winningCard = null,
    Object? markedCells = null,
  }) {
    return _then(
      _value.copyWith(
            playerId: null == playerId
                ? _value.playerId
                : playerId // ignore: cast_nullable_to_non_nullable
                      as String,
            playerName: null == playerName
                ? _value.playerName
                : playerName // ignore: cast_nullable_to_non_nullable
                      as String,
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
            winningCard: null == winningCard
                ? _value.winningCard
                : winningCard // ignore: cast_nullable_to_non_nullable
                      as List<List<int>>,
            markedCells: null == markedCells
                ? _value.markedCells
                : markedCells // ignore: cast_nullable_to_non_nullable
                      as List<List<bool>>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WinnerModelImplCopyWith<$Res>
    implements $WinnerModelCopyWith<$Res> {
  factory _$$WinnerModelImplCopyWith(
    _$WinnerModelImpl value,
    $Res Function(_$WinnerModelImpl) then,
  ) = __$$WinnerModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String playerId,
    String playerName,
    int cardNumber,
    String pattern,
    DateTime completedAt,
    List<List<int>> winningCard,
    List<List<bool>> markedCells,
  });
}

/// @nodoc
class __$$WinnerModelImplCopyWithImpl<$Res>
    extends _$WinnerModelCopyWithImpl<$Res, _$WinnerModelImpl>
    implements _$$WinnerModelImplCopyWith<$Res> {
  __$$WinnerModelImplCopyWithImpl(
    _$WinnerModelImpl _value,
    $Res Function(_$WinnerModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WinnerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? playerName = null,
    Object? cardNumber = null,
    Object? pattern = null,
    Object? completedAt = null,
    Object? winningCard = null,
    Object? markedCells = null,
  }) {
    return _then(
      _$WinnerModelImpl(
        playerId: null == playerId
            ? _value.playerId
            : playerId // ignore: cast_nullable_to_non_nullable
                  as String,
        playerName: null == playerName
            ? _value.playerName
            : playerName // ignore: cast_nullable_to_non_nullable
                  as String,
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
        winningCard: null == winningCard
            ? _value._winningCard
            : winningCard // ignore: cast_nullable_to_non_nullable
                  as List<List<int>>,
        markedCells: null == markedCells
            ? _value._markedCells
            : markedCells // ignore: cast_nullable_to_non_nullable
                  as List<List<bool>>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WinnerModelImpl implements _WinnerModel {
  const _$WinnerModelImpl({
    required this.playerId,
    required this.playerName,
    required this.cardNumber,
    required this.pattern,
    required this.completedAt,
    required final List<List<int>> winningCard,
    required final List<List<bool>> markedCells,
  }) : _winningCard = winningCard,
       _markedCells = markedCells;

  factory _$WinnerModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WinnerModelImplFromJson(json);

  @override
  final String playerId;
  @override
  final String playerName;
  @override
  final int cardNumber;
  @override
  final String pattern;
  @override
  final DateTime completedAt;
  final List<List<int>> _winningCard;
  @override
  List<List<int>> get winningCard {
    if (_winningCard is EqualUnmodifiableListView) return _winningCard;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_winningCard);
  }

  final List<List<bool>> _markedCells;
  @override
  List<List<bool>> get markedCells {
    if (_markedCells is EqualUnmodifiableListView) return _markedCells;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_markedCells);
  }

  @override
  String toString() {
    return 'WinnerModel(playerId: $playerId, playerName: $playerName, cardNumber: $cardNumber, pattern: $pattern, completedAt: $completedAt, winningCard: $winningCard, markedCells: $markedCells)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WinnerModelImpl &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.playerName, playerName) ||
                other.playerName == playerName) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.pattern, pattern) || other.pattern == pattern) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            const DeepCollectionEquality().equals(
              other._winningCard,
              _winningCard,
            ) &&
            const DeepCollectionEquality().equals(
              other._markedCells,
              _markedCells,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    playerId,
    playerName,
    cardNumber,
    pattern,
    completedAt,
    const DeepCollectionEquality().hash(_winningCard),
    const DeepCollectionEquality().hash(_markedCells),
  );

  /// Create a copy of WinnerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WinnerModelImplCopyWith<_$WinnerModelImpl> get copyWith =>
      __$$WinnerModelImplCopyWithImpl<_$WinnerModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WinnerModelImplToJson(this);
  }
}

abstract class _WinnerModel implements WinnerModel {
  const factory _WinnerModel({
    required final String playerId,
    required final String playerName,
    required final int cardNumber,
    required final String pattern,
    required final DateTime completedAt,
    required final List<List<int>> winningCard,
    required final List<List<bool>> markedCells,
  }) = _$WinnerModelImpl;

  factory _WinnerModel.fromJson(Map<String, dynamic> json) =
      _$WinnerModelImpl.fromJson;

  @override
  String get playerId;
  @override
  String get playerName;
  @override
  int get cardNumber;
  @override
  String get pattern;
  @override
  DateTime get completedAt;
  @override
  List<List<int>> get winningCard;
  @override
  List<List<bool>> get markedCells;

  /// Create a copy of WinnerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WinnerModelImplCopyWith<_$WinnerModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
