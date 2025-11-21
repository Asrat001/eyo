// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  bool get isAdmin => throw _privateConstructorUsedError;
  bool get isSuperAdmin => throw _privateConstructorUsedError;
  int get credits => throw _privateConstructorUsedError;
  double get wallet => throw _privateConstructorUsedError;
  Map<String, int> get gameCredits => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({
    String id,
    String username,
    bool isAdmin,
    bool isSuperAdmin,
    int credits,
    double wallet,
    Map<String, int> gameCredits,
    String? email,
  });
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? isAdmin = null,
    Object? isSuperAdmin = null,
    Object? credits = null,
    Object? wallet = null,
    Object? gameCredits = null,
    Object? email = freezed,
  }) {
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
            isAdmin: null == isAdmin
                ? _value.isAdmin
                : isAdmin // ignore: cast_nullable_to_non_nullable
                      as bool,
            isSuperAdmin: null == isSuperAdmin
                ? _value.isSuperAdmin
                : isSuperAdmin // ignore: cast_nullable_to_non_nullable
                      as bool,
            credits: null == credits
                ? _value.credits
                : credits // ignore: cast_nullable_to_non_nullable
                      as int,
            wallet: null == wallet
                ? _value.wallet
                : wallet // ignore: cast_nullable_to_non_nullable
                      as double,
            gameCredits: null == gameCredits
                ? _value.gameCredits
                : gameCredits // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
    _$UserModelImpl value,
    $Res Function(_$UserModelImpl) then,
  ) = __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String username,
    bool isAdmin,
    bool isSuperAdmin,
    int credits,
    double wallet,
    Map<String, int> gameCredits,
    String? email,
  });
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
    _$UserModelImpl _value,
    $Res Function(_$UserModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? isAdmin = null,
    Object? isSuperAdmin = null,
    Object? credits = null,
    Object? wallet = null,
    Object? gameCredits = null,
    Object? email = freezed,
  }) {
    return _then(
      _$UserModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        isAdmin: null == isAdmin
            ? _value.isAdmin
            : isAdmin // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSuperAdmin: null == isSuperAdmin
            ? _value.isSuperAdmin
            : isSuperAdmin // ignore: cast_nullable_to_non_nullable
                  as bool,
        credits: null == credits
            ? _value.credits
            : credits // ignore: cast_nullable_to_non_nullable
                  as int,
        wallet: null == wallet
            ? _value.wallet
            : wallet // ignore: cast_nullable_to_non_nullable
                  as double,
        gameCredits: null == gameCredits
            ? _value._gameCredits
            : gameCredits // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl({
    required this.id,
    required this.username,
    this.isAdmin = false,
    this.isSuperAdmin = false,
    this.credits = 0,
    this.wallet = 0.0,
    final Map<String, int> gameCredits = const {},
    this.email,
  }) : _gameCredits = gameCredits;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  @JsonKey()
  final bool isAdmin;
  @override
  @JsonKey()
  final bool isSuperAdmin;
  @override
  @JsonKey()
  final int credits;
  @override
  @JsonKey()
  final double wallet;
  final Map<String, int> _gameCredits;
  @override
  @JsonKey()
  Map<String, int> get gameCredits {
    if (_gameCredits is EqualUnmodifiableMapView) return _gameCredits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_gameCredits);
  }

  @override
  final String? email;

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, isAdmin: $isAdmin, isSuperAdmin: $isSuperAdmin, credits: $credits, wallet: $wallet, gameCredits: $gameCredits, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.isSuperAdmin, isSuperAdmin) ||
                other.isSuperAdmin == isSuperAdmin) &&
            (identical(other.credits, credits) || other.credits == credits) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            const DeepCollectionEquality().equals(
              other._gameCredits,
              _gameCredits,
            ) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    username,
    isAdmin,
    isSuperAdmin,
    credits,
    wallet,
    const DeepCollectionEquality().hash(_gameCredits),
    email,
  );

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(this);
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel({
    required final String id,
    required final String username,
    final bool isAdmin,
    final bool isSuperAdmin,
    final int credits,
    final double wallet,
    final Map<String, int> gameCredits,
    final String? email,
  }) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  bool get isAdmin;
  @override
  bool get isSuperAdmin;
  @override
  int get credits;
  @override
  double get wallet;
  @override
  Map<String, int> get gameCredits;
  @override
  String? get email;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
