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

BingoCellModel _$BingoCellModelFromJson(Map<String, dynamic> json) {
  return _BingoCellModel.fromJson(json);
}

/// @nodoc
mixin _$BingoCellModel {
  int? get number => throw _privateConstructorUsedError;
  bool get isMarked => throw _privateConstructorUsedError;
  bool get isFreeSpace => throw _privateConstructorUsedError;

  /// Serializes this BingoCellModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BingoCellModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BingoCellModelCopyWith<BingoCellModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BingoCellModelCopyWith<$Res> {
  factory $BingoCellModelCopyWith(
    BingoCellModel value,
    $Res Function(BingoCellModel) then,
  ) = _$BingoCellModelCopyWithImpl<$Res, BingoCellModel>;
  @useResult
  $Res call({int? number, bool isMarked, bool isFreeSpace});
}

/// @nodoc
class _$BingoCellModelCopyWithImpl<$Res, $Val extends BingoCellModel>
    implements $BingoCellModelCopyWith<$Res> {
  _$BingoCellModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BingoCellModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? isMarked = null,
    Object? isFreeSpace = null,
  }) {
    return _then(
      _value.copyWith(
            number: freezed == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as int?,
            isMarked: null == isMarked
                ? _value.isMarked
                : isMarked // ignore: cast_nullable_to_non_nullable
                      as bool,
            isFreeSpace: null == isFreeSpace
                ? _value.isFreeSpace
                : isFreeSpace // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BingoCellModelImplCopyWith<$Res>
    implements $BingoCellModelCopyWith<$Res> {
  factory _$$BingoCellModelImplCopyWith(
    _$BingoCellModelImpl value,
    $Res Function(_$BingoCellModelImpl) then,
  ) = __$$BingoCellModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? number, bool isMarked, bool isFreeSpace});
}

/// @nodoc
class __$$BingoCellModelImplCopyWithImpl<$Res>
    extends _$BingoCellModelCopyWithImpl<$Res, _$BingoCellModelImpl>
    implements _$$BingoCellModelImplCopyWith<$Res> {
  __$$BingoCellModelImplCopyWithImpl(
    _$BingoCellModelImpl _value,
    $Res Function(_$BingoCellModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BingoCellModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? isMarked = null,
    Object? isFreeSpace = null,
  }) {
    return _then(
      _$BingoCellModelImpl(
        number: freezed == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as int?,
        isMarked: null == isMarked
            ? _value.isMarked
            : isMarked // ignore: cast_nullable_to_non_nullable
                  as bool,
        isFreeSpace: null == isFreeSpace
            ? _value.isFreeSpace
            : isFreeSpace // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BingoCellModelImpl implements _BingoCellModel {
  const _$BingoCellModelImpl({
    this.number,
    this.isMarked = false,
    this.isFreeSpace = false,
  });

  factory _$BingoCellModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BingoCellModelImplFromJson(json);

  @override
  final int? number;
  @override
  @JsonKey()
  final bool isMarked;
  @override
  @JsonKey()
  final bool isFreeSpace;

  @override
  String toString() {
    return 'BingoCellModel(number: $number, isMarked: $isMarked, isFreeSpace: $isFreeSpace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BingoCellModelImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.isMarked, isMarked) ||
                other.isMarked == isMarked) &&
            (identical(other.isFreeSpace, isFreeSpace) ||
                other.isFreeSpace == isFreeSpace));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, number, isMarked, isFreeSpace);

  /// Create a copy of BingoCellModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BingoCellModelImplCopyWith<_$BingoCellModelImpl> get copyWith =>
      __$$BingoCellModelImplCopyWithImpl<_$BingoCellModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BingoCellModelImplToJson(this);
  }
}

abstract class _BingoCellModel implements BingoCellModel {
  const factory _BingoCellModel({
    final int? number,
    final bool isMarked,
    final bool isFreeSpace,
  }) = _$BingoCellModelImpl;

  factory _BingoCellModel.fromJson(Map<String, dynamic> json) =
      _$BingoCellModelImpl.fromJson;

  @override
  int? get number;
  @override
  bool get isMarked;
  @override
  bool get isFreeSpace;

  /// Create a copy of BingoCellModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BingoCellModelImplCopyWith<_$BingoCellModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BingoCardModel _$BingoCardModelFromJson(Map<String, dynamic> json) {
  return _BingoCardModel.fromJson(json);
}

/// @nodoc
mixin _$BingoCardModel {
  String get id => throw _privateConstructorUsedError;
  List<List<BingoCellModel>> get grid => throw _privateConstructorUsedError;
  String get playerId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

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
    String id,
    List<List<BingoCellModel>> grid,
    String playerId,
    DateTime createdAt,
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
    Object? id = null,
    Object? grid = null,
    Object? playerId = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            grid: null == grid
                ? _value.grid
                : grid // ignore: cast_nullable_to_non_nullable
                      as List<List<BingoCellModel>>,
            playerId: null == playerId
                ? _value.playerId
                : playerId // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$BingoCardModelImplCopyWith<$Res>
    implements $BingoCardModelCopyWith<$Res> {
  factory _$$BingoCardModelImplCopyWith(
    _$BingoCardModelImpl value,
    $Res Function(_$BingoCardModelImpl) then,
  ) = __$$BingoCardModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    List<List<BingoCellModel>> grid,
    String playerId,
    DateTime createdAt,
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
    Object? id = null,
    Object? grid = null,
    Object? playerId = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$BingoCardModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        grid: null == grid
            ? _value._grid
            : grid // ignore: cast_nullable_to_non_nullable
                  as List<List<BingoCellModel>>,
        playerId: null == playerId
            ? _value.playerId
            : playerId // ignore: cast_nullable_to_non_nullable
                  as String,
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
class _$BingoCardModelImpl implements _BingoCardModel {
  const _$BingoCardModelImpl({
    required this.id,
    required final List<List<BingoCellModel>> grid,
    required this.playerId,
    required this.createdAt,
  }) : _grid = grid;

  factory _$BingoCardModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BingoCardModelImplFromJson(json);

  @override
  final String id;
  final List<List<BingoCellModel>> _grid;
  @override
  List<List<BingoCellModel>> get grid {
    if (_grid is EqualUnmodifiableListView) return _grid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_grid);
  }

  @override
  final String playerId;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'BingoCardModel(id: $id, grid: $grid, playerId: $playerId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BingoCardModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._grid, _grid) &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    const DeepCollectionEquality().hash(_grid),
    playerId,
    createdAt,
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
    required final String id,
    required final List<List<BingoCellModel>> grid,
    required final String playerId,
    required final DateTime createdAt,
  }) = _$BingoCardModelImpl;

  factory _BingoCardModel.fromJson(Map<String, dynamic> json) =
      _$BingoCardModelImpl.fromJson;

  @override
  String get id;
  @override
  List<List<BingoCellModel>> get grid;
  @override
  String get playerId;
  @override
  DateTime get createdAt;

  /// Create a copy of BingoCardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BingoCardModelImplCopyWith<_$BingoCardModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
