import 'package:eyo_bingo/core/data/models/bingo/bingo_game_detail_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/data/models/bingo/bingo_game_model.dart';
import '../../../../core/models/api_response.dart';
import '../../../../di.dart';
import '../../domain/repositories/number_bingo_repository.dart';

// ============= REPOSITORY PROVIDER =============
final numberBingoRepositoryProvider = Provider<NumberBingoRepository>(
  (ref) => sl<NumberBingoRepository>(),
);

// ============= STATE PROVIDERS =============

/// Available games list
final availableGamesProvider = StateProvider<List<BingoGameModel>>((ref) => []);

/// Current game details
final currentGameProvider = StateProvider<Map<String, dynamic>?>((ref) => null);

/// Loading state
final bingoLoadingProvider = StateProvider<bool>((ref) => false);

/// Error message
final bingoErrorProvider = StateProvider<String?>((ref) => null);

// ============= ACTION PROVIDERS =============

/// Fetch available games
final fetchGamesActionProvider = Provider<Future<void> Function()>((ref) {
  return () async {
    ref.read(bingoLoadingProvider.notifier).state = true;
    ref.read(bingoErrorProvider.notifier).state = null;

    try {
      final repository = ref.read(numberBingoRepositoryProvider);
      final result = await repository.getGames();

      result.when(
        success: (games) {
          ref.read(availableGamesProvider.notifier).state = games;
          ref.read(bingoLoadingProvider.notifier).state = false;
        },
        failure: (error) {
          ref.read(bingoErrorProvider.notifier).state = error.toString();
          ref.read(bingoLoadingProvider.notifier).state = false;
        },
      );
    } catch (e) {
      ref.read(bingoErrorProvider.notifier).state = e.toString();
      ref.read(bingoLoadingProvider.notifier).state = false;
    }
  };
});

final fetchGameDetailsProvider =
    FutureProvider.family<BingoGameDetailModel?, String>((ref, gameId) async {
  final repository = ref.read(numberBingoRepositoryProvider);
  final result = await repository.getGameDetails(gameId);

  return result.when(
    success: (data) => BingoGameDetailModel.fromJson(data),
    failure: (error) => null,
  );
});


/// Create new game (Admin)
final createGameActionProvider =
    Provider<
      Future<ApiResponse<Map<String, dynamic>>> Function({
        required int maxPlayers,
        String winningPattern,
        int autoCallInterval,
        String markingMode,
        double playerEntryFee,
        int profitPercentage,
      })
    >((ref) {
      return ({
        required int maxPlayers,
        String winningPattern = 'any-line',
        int autoCallInterval = 3000,
        String markingMode = 'auto',
        double playerEntryFee = 10,
        int profitPercentage = 10,
      }) async {
        ref.read(bingoLoadingProvider.notifier).state = true;
        ref.read(bingoErrorProvider.notifier).state = null;

        try {
          final repository = ref.read(numberBingoRepositoryProvider);
          final result = await repository.createGame(
            maxPlayers: maxPlayers,
            winningPattern: winningPattern,
            autoCallInterval: autoCallInterval,
            markingMode: markingMode,
            playerEntryFee: playerEntryFee,
            profitPercentage: profitPercentage,
          );

          ref.read(bingoLoadingProvider.notifier).state = false;
          return result;
        } catch (e) {
          ref.read(bingoErrorProvider.notifier).state = e.toString();
          ref.read(bingoLoadingProvider.notifier).state = false;
          rethrow;
        }
      };
    });

/// Prepare game (Admin)
final prepareGameActionProvider =
    Provider<Future<ApiResponse<Map<String, dynamic>>> Function(String gameId)>(
      (ref) {
        return (String gameId) async {
          final repository = ref.read(numberBingoRepositoryProvider);
          return await repository.prepareGame(gameId);
        };
      },
    );

/// Start game (Admin)
final startGameActionProvider =
    Provider<Future<ApiResponse<Map<String, dynamic>>> Function(String gameId)>(
      (ref) {
        return (String gameId) async {
          final repository = ref.read(numberBingoRepositoryProvider);
          return await repository.startGame(gameId);
        };
      },
    );

/// Pause game (Admin)
final pauseGameActionProvider =
    Provider<Future<ApiResponse<Map<String, dynamic>>> Function(String gameId)>(
      (ref) {
        return (String gameId) async {
          final repository = ref.read(numberBingoRepositoryProvider);
          return await repository.pauseGame(gameId);
        };
      },
    );

/// Resume game (Admin)
final resumeGameActionProvider =
    Provider<Future<ApiResponse<Map<String, dynamic>>> Function(String gameId)>(
      (ref) {
        return (String gameId) async {
          final repository = ref.read(numberBingoRepositoryProvider);
          return await repository.resumeGame(gameId);
        };
      },
    );

/// Stop game (Admin)
final stopGameActionProvider =
    Provider<Future<ApiResponse<Map<String, dynamic>>> Function(String gameId)>(
      (ref) {
        return (String gameId) async {
          final repository = ref.read(numberBingoRepositoryProvider);
          return await repository.stopGame(gameId);
        };
      },
    );

/// Call number manually (Admin)
final callNumberActionProvider =
    Provider<Future<ApiResponse<Map<String, dynamic>>> Function(String gameId)>(
      (ref) {
        return (String gameId) async {
          final repository = ref.read(numberBingoRepositoryProvider);
          return await repository.callNumber(gameId);
        };
      },
    );
