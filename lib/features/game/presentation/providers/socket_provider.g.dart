// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socket_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$socketServiceHash() => r'ccdec26964cbbe90779be729b533482d26a4beda';

/// Socket service provider
///
/// Copied from [socketService].
@ProviderFor(socketService)
final socketServiceProvider = AutoDisposeProvider<SocketService>.internal(
  socketService,
  name: r'socketServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$socketServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SocketServiceRef = AutoDisposeProviderRef<SocketService>;
String _$socketEventListenerHash() =>
    r'fa61df5fc8a9ca3db5af27649c1dd390d1f5d49b';

/// Socket event listener provider
///
/// Copied from [SocketEventListener].
@ProviderFor(SocketEventListener)
final socketEventListenerProvider =
    AutoDisposeNotifierProvider<SocketEventListener, void>.internal(
      SocketEventListener.new,
      name: r'socketEventListenerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$socketEventListenerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SocketEventListener = AutoDisposeNotifier<void>;
String _$gameRoomConnectionHash() =>
    r'962863c0be5d23d047089a921359e67031940515';

/// Connect to game room
///
/// Copied from [GameRoomConnection].
@ProviderFor(GameRoomConnection)
final gameRoomConnectionProvider =
    AutoDisposeNotifierProvider<GameRoomConnection, bool>.internal(
      GameRoomConnection.new,
      name: r'gameRoomConnectionProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$gameRoomConnectionHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$GameRoomConnection = AutoDisposeNotifier<bool>;
String _$bingoClaimActionHash() => r'5120aefdc4621f5b30ddea781cb00fd2945e07f3';

/// Claim bingo action
///
/// Copied from [BingoClaimAction].
@ProviderFor(BingoClaimAction)
final bingoClaimActionProvider =
    AutoDisposeNotifierProvider<BingoClaimAction, bool>.internal(
      BingoClaimAction.new,
      name: r'bingoClaimActionProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$bingoClaimActionHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$BingoClaimAction = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
