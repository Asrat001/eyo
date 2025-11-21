// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bingo_card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BingoCardModel _$BingoCardModelFromJson(Map<String, dynamic> json) {
  return _BingoCardModel.fromJson(json);
}

/// @nodoc
mixin _$BingoCardModel {
  String get player => throw _privateConstructorUsedError;
  int get cardNumber => throw _privateConstructorUsedError;
  List<List<int>> get grid =>
      throw _privateConstructorUsedError; // 5x5 grid [col][row]
  List<List<bool>> get marked =>
      throw _privateConstructorUsedError; // 5x5 marked cells
  DateTime get joinedAt => throw _privateConstructorUsedError;

  /// Serializes this BingoCardModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BingoCardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BingoCardModelCopyWith<BingoCardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BingoCardModelCopyWith<$Res> {
  factory $BingoCardModelCopyWith(
    BingoCardModel value,
    $Res Function(BingoCardModel) then,
  ) = _$BingoCardModelCopyWithImpl<$Res, BingoCardModel>;
  @useResult
  $Res call({
    String player,
    int cardNumber,
    List<List<int>> grid,
    List<List<bool>> marked,
    DateTime joinedAt,
  });
}

/// @nodoc
class _$BingoCardModelCopyWithImpl<$Res, $Val extends BingoCardModel>
    implements $BingoCardModelCopyWith<$Res> {
  _$BingoCardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BingoCardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? cardNumber = null,
    Object? grid = null,
    Object? marked = null,
    Object? joinedAt = null,
  }) {
    return _then(
      _value.copyWith(
            player: null == player
                ? _value.player
                : player // ignore: cast_nullable_to_non_nullable
                      as String,
            cardNumber: null == cardNumber
                ? _value.cardNumber
                : cardNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            grid: null == grid
                ? _value.grid
                : grid // ignore: cast_nullable_to_non_nullable
                      as List<List<int>>,
            marked: null == marked
                ? _value.marked
                : marked // ignore: cast_nullable_to_non_nullable
                      as List<List<bool>>,
            joinedAt: null == joinedAt
                ? _value.joinedAt
                : joinedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BingoCardModelImplCopyWith<$Res>
    implements $BingoCardModelCopyWith<$Res> {
  factory _$$BingoCardModelImplCopyWith(
    _$BingoCardModelImpl value,
    $Res Function(_$BingoCardModelImpl) then,
  ) = __$$BingoCardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String player,
    int cardNumber,
    List<List<int>> grid,
    List<List<bool>> marked,
    DateTime joinedAt,
  });
}

/// @nodoc
class __$$BingoCardModelImplCopyWithImpl<$Res>
    extends _$BingoCardModelCopyWithImpl<$Res, _$BingoCardModelImpl>
    implements _$$BingoCardModelImplCopyWith<$Res> {
  __$$BingoCardModelImplCopyWithImpl(
    _$BingoCardModelImpl _value,
    $Res Function(_$BingoCardModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BingoCardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? cardNumber = null,
    Object? grid = null,
    Object? marked = null,
    Object? joinedAt = null,
  }) {
    return _then(
      _$BingoCardModelImpl(
        player: null == player
            ? _value.player
            : player // ignore: cast_nullable_to_non_nullable
                  as String,
        cardNumber: null == cardNumber
            ? _value.cardNumber
            : cardNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        grid: null == grid
            ? _value._grid
            : grid // ignore: cast_nullable_to_non_nullable
                  as List<List<int>>,
        marked: null == marked
            ? _value._marked
            : marked // ignore: cast_nullable_to_non_nullable
                  as List<List<bool>>,
        joinedAt: null == joinedAt
            ? _value.joinedAt
            : joinedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BingoCardModelImpl implements _BingoCardModel {
  const _$BingoCardModelImpl({
    required this.player,
    required this.cardNumber,
    required final List<List<int>> grid,
    required final List<List<bool>> marked,
    required this.joinedAt,
  }) : _grid = grid,
       _marked = marked;

  factory _$BingoCardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BingoCardModelImplFromJson(json);

  @override
  final String player;
  @override
  final int cardNumber;
  final List<List<int>> _grid;
  @override
  List<List<int>> get grid {
    if (_grid is EqualUnmodifiableListView) return _grid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_grid);
  }

  // 5x5 grid [col][row]
  final List<List<bool>> _marked;
  // 5x5 grid [col][row]
  @override
  List<List<bool>> get marked {
    if (_marked is EqualUnmodifiableListView) return _marked;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_marked);
  }

  // 5x5 marked cells
  @override
  final DateTime joinedAt;

  @override
  String toString() {
    return 'BingoCardModel(player: $player, cardNumber: $cardNumber, grid: $grid, marked: $marked, joinedAt: $joinedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BingoCardModelImpl &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            const DeepCollectionEquality().equals(other._grid, _grid) &&
            const DeepCollectionEquality().equals(other._marked, _marked) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    player,
    cardNumber,
    const DeepCollectionEquality().hash(_grid),
    const DeepCollectionEquality().hash(_marked),
    joinedAt,
  );

  /// Create a copy of BingoCardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BingoCardModelImplCopyWith<_$BingoCardModelImpl> get copyWith =>
      __$$BingoCardModelImplCopyWithImpl<_$BingoCardModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BingoCardModelImplToJson(this);
  }
}

abstract class _BingoCardModel implements BingoCardModel {
  const factory _BingoCardModel({
    required final String player,
    required final int cardNumber,
    required final List<List<int>> grid,
    required final List<List<bool>> marked,
    required final DateTime joinedAt,
  }) = _$BingoCardModelImpl;

  factory _BingoCardModel.fromJson(Map<String, dynamic> json) =
      _$BingoCardModelImpl.fromJson;

  @override
  String get player;
  @override
  int get cardNumber;
  @override
  List<List<int>> get grid; // 5x5 grid [col][row]
  @override
  List<List<bool>> get marked; // 5x5 marked cells
  @override
  DateTime get joinedAt;

  /// Create a copy of BingoCardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BingoCardModelImplCopyWith<_$BingoCardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
