// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gameCoordinatorHash() => r'cf332c07d38a2d967d56ac9f5fa21ea778db53b8';

/// Game coordinator provider
///
/// Copied from [gameCoordinator].
@ProviderFor(gameCoordinator)
final gameCoordinatorProvider = AutoDisposeProvider<GameCoordinator>.internal(
  gameCoordinator,
  name: r'gameCoordinatorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gameCoordinatorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GameCoordinatorRef = AutoDisposeProviderRef<GameCoordinator>;
String _$currentPlayerIdHash() => r'049d87f47680b90c1bca7b3727a0cc714903d3ed';

/// Current player ID provider (from auth)
///
/// Copied from [currentPlayerId].
@ProviderFor(currentPlayerId)
final currentPlayerIdProvider = AutoDisposeProvider<String?>.internal(
  currentPlayerId,
  name: r'currentPlayerIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentPlayerIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentPlayerIdRef = AutoDisposeProviderRef<String?>;
String _$canClaimBingoHash() => r'5fd4b2bfaa0040bf2c897008f8789028f64b2f6d';

/// Can claim bingo provider
///
/// Copied from [canClaimBingo].
@ProviderFor(canClaimBingo)
final canClaimBingoProvider = AutoDisposeProvider<bool>.internal(
  canClaimBingo,
  name: r'canClaimBingoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$canClaimBingoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CanClaimBingoRef = AutoDisposeProviderRef<bool>;
String _$gameStatusTextHash() => r'65f787d0f0ad2724c9ed13f88b438093c2da0901';

/// Game status text provider
///
/// Copied from [gameStatusText].
@ProviderFor(gameStatusText)
final gameStatusTextProvider = AutoDisposeProvider<String>.internal(
  gameStatusText,
  name: r'gameStatusTextProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gameStatusTextHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GameStatusTextRef = AutoDisposeProviderRef<String>;
String _$currentGameHash() => r'8a7eb2a54b6f8aa88a69515714a55146b887690a';

/// Current game state provider
///
/// Copied from [CurrentGame].
@ProviderFor(CurrentGame)
final currentGameProvider =
    AutoDisposeNotifierProvider<CurrentGame, Game?>.internal(
      CurrentGame.new,
      name: r'currentGameProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$currentGameHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CurrentGame = AutoDisposeNotifier<Game?>;
String _$playerCardHash() => r'b3ad3d7da4f9a0ef4b3bfd4ca8ced56dc2b282f5';

/// Player's bingo card provider
///
/// Copied from [PlayerCard].
@ProviderFor(PlayerCard)
final playerCardProvider =
    AutoDisposeNotifierProvider<PlayerCard, BingoCard?>.internal(
      PlayerCard.new,
      name: r'playerCardProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$playerCardHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PlayerCard = AutoDisposeNotifier<BingoCard?>;
String _$calledNumbersHash() => r'06d39d2ecd3917ff266d4247283240525c6b6b9c';

/// Called numbers provider
///
/// Copied from [CalledNumbers].
@ProviderFor(CalledNumbers)
final calledNumbersProvider =
    AutoDisposeNotifierProvider<CalledNumbers, List<int>>.internal(
      CalledNumbers.new,
      name: r'calledNumbersProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$calledNumbersHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CalledNumbers = AutoDisposeNotifier<List<int>>;
String _$gamePlayersHash() => r'88241bbb8a7107d781352e666aa77eac96f43cc2';

/// Players in game provider
///
/// Copied from [GamePlayers].
@ProviderFor(GamePlayers)
final gamePlayersProvider =
    AutoDisposeNotifierProvider<GamePlayers, List<Player>>.internal(
      GamePlayers.new,
      name: r'gamePlayersProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$gamePlayersHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$GamePlayers = AutoDisposeNotifier<List<Player>>;
String _$socketConnectionHash() => r'00fc67d260c53f0e57ec30378f2e37b02cf42918';

/// Socket connection state provider
///
/// Copied from [SocketConnection].
@ProviderFor(SocketConnection)
final socketConnectionProvider =
    AutoDisposeNotifierProvider<SocketConnection, bool>.internal(
      SocketConnection.new,
      name: r'socketConnectionProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$socketConnectionHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SocketConnection = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
