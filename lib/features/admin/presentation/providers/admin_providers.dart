import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/data/models/bingo/user_model.dart';
import '../../../../core/models/api_response.dart';
import '../../../../di.dart';
import '../../../admin/domain/repositories/admin_repository.dart';

// ============= REPOSITORY PROVIDER =============
final adminRepositoryProvider = Provider<AdminRepository>(
  (ref) => sl<AdminRepository>(),
);

// ============= STATE PROVIDERS =============

/// Players list
final playersListProvider = StateProvider<List<UserModel>>((ref) => []);

/// Admins list
final adminsListProvider = StateProvider<List<UserModel>>((ref) => []);

/// Loading state
final adminLoadingProvider = StateProvider<bool>((ref) => false);

/// Error message
final adminErrorProvider = StateProvider<String?>((ref) => null);

// ============= ACTION PROVIDERS =============

/// Fetch all players (Admin)
final fetchPlayersActionProvider = Provider<Future<void> Function()>((ref) {
  return () async {
    ref.read(adminLoadingProvider.notifier).state = true;
    ref.read(adminErrorProvider.notifier).state = null;

    try {
      final repository = ref.read(adminRepositoryProvider);
      final result = await repository.getPlayers();

      result.when(
        success: (players) {
          ref.read(playersListProvider.notifier).state = players;
          ref.read(adminLoadingProvider.notifier).state = false;
        },
        failure: (error) {
          ref.read(adminErrorProvider.notifier).state = error.toString();
          ref.read(adminLoadingProvider.notifier).state = false;
        },
      );
    } catch (e) {
      ref.read(adminErrorProvider.notifier).state = e.toString();
      ref.read(adminLoadingProvider.notifier).state = false;
    }
  };
});

/// Fetch all admins (Super Admin)
final fetchAdminsActionProvider = Provider<Future<void> Function()>((ref) {
  return () async {
    ref.read(adminLoadingProvider.notifier).state = true;
    ref.read(adminErrorProvider.notifier).state = null;

    try {
      final repository = ref.read(adminRepositoryProvider);
      final result = await repository.getAdmins();

      result.when(
        success: (admins) {
          ref.read(adminsListProvider.notifier).state = admins;
          ref.read(adminLoadingProvider.notifier).state = false;
        },
        failure: (error) {
          ref.read(adminErrorProvider.notifier).state = error.toString();
          ref.read(adminLoadingProvider.notifier).state = false;
        },
      );
    } catch (e) {
      ref.read(adminErrorProvider.notifier).state = e.toString();
      ref.read(adminLoadingProvider.notifier).state = false;
    }
  };
});

/// Add to player wallet
final addToPlayerWalletActionProvider =
    Provider<
      Future<ApiResponse<Map<String, dynamic>>> Function(
        String playerId,
        double amount,
      )
    >((ref) {
      return (String playerId, double amount) async {
        final repository = ref.read(adminRepositoryProvider);
        return await repository.addToPlayerWallet(playerId, amount);
      };
    });

/// Subtract from player wallet
final subtractFromPlayerWalletActionProvider =
    Provider<
      Future<ApiResponse<Map<String, dynamic>>> Function(
        String playerId,
        double amount,
      )
    >((ref) {
      return (String playerId, double amount) async {
        final repository = ref.read(adminRepositoryProvider);
        return await repository.subtractFromPlayerWallet(playerId, amount);
      };
    });

/// Set player wallet
final setPlayerWalletActionProvider =
    Provider<
      Future<ApiResponse<Map<String, dynamic>>> Function(
        String playerId,
        double amount,
      )
    >((ref) {
      return (String playerId, double amount) async {
        final repository = ref.read(adminRepositoryProvider);
        return await repository.setPlayerWallet(playerId, amount);
      };
    });

/// Add credits to admin (Super Admin)
final addCreditsToAdminActionProvider =
    Provider<
      Future<ApiResponse<Map<String, dynamic>>> Function(
        String adminId,
        int credits,
      )
    >((ref) {
      return (String adminId, int credits) async {
        final repository = ref.read(adminRepositoryProvider);
        return await repository.addCreditsToAdmin(adminId, credits);
      };
    });

/// Set admin credits (Super Admin)
final setAdminCreditsActionProvider =
    Provider<
      Future<ApiResponse<Map<String, dynamic>>> Function(
        String adminId,
        int credits,
      )
    >((ref) {
      return (String adminId, int credits) async {
        final repository = ref.read(adminRepositoryProvider);
        return await repository.setAdminCredits(adminId, credits);
      };
    });
