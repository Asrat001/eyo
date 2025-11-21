import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/data/models/bingo/user_model.dart';
import '../../../../core/models/api_response.dart';
import '../../../../di.dart';
import '../../domain/repositories/auth_repository.dart';

// ============= REPOSITORY PROVIDER =============
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => sl<AuthRepository>(),
);

// ============= STATE PROVIDERS =============

/// Current authenticated user
final currentUserProvider = StateProvider<UserModel?>((ref) => null);

/// Auth loading state
final authLoadingProvider = StateProvider<bool>((ref) => false);

/// Auth error message
final authErrorProvider = StateProvider<String?>((ref) => null);

// ============= ACTION PROVIDERS =============

/// Login action provider
final loginActionProvider =
    Provider<
      Future<ApiResponse<UserModel>> Function({
        required String username,
        required String password,
      })
    >((ref) {
      return ({required String username, required String password}) async {
        ref.read(authLoadingProvider.notifier).state = true;
        ref.read(authErrorProvider.notifier).state = null;

        try {
          final repository = ref.read(authRepositoryProvider);
          final result = await repository.login(username, password);

          result.when(
            success: (user) {
              ref.read(currentUserProvider.notifier).state = user;
              ref.read(authLoadingProvider.notifier).state = false;
            },
            failure: (error) {
              ref.read(authErrorProvider.notifier).state = error.toString();
              ref.read(authLoadingProvider.notifier).state = false;
            },
          );

          return result;
        } catch (e) {
          ref.read(authErrorProvider.notifier).state = e.toString();
          ref.read(authLoadingProvider.notifier).state = false;
          rethrow;
        }
      };
    });

/// Register action provider
final registerActionProvider =
    Provider<
      Future<ApiResponse<UserModel>> Function({
        required String username,
        required String password,
      })
    >((ref) {
      return ({required String username, required String password}) async {
        ref.read(authLoadingProvider.notifier).state = true;
        ref.read(authErrorProvider.notifier).state = null;

        try {
          final repository = ref.read(authRepositoryProvider);
          final result = await repository.register(username, password);

          result.when(
            success: (user) {
              ref.read(currentUserProvider.notifier).state = user;
              ref.read(authLoadingProvider.notifier).state = false;
            },
            failure: (error) {
              ref.read(authErrorProvider.notifier).state = error.toString();
              ref.read(authLoadingProvider.notifier).state = false;
            },
          );

          return result;
        } catch (e) {
          ref.read(authErrorProvider.notifier).state = e.toString();
          ref.read(authLoadingProvider.notifier).state = false;
          rethrow;
        }
      };
    });

/// Logout action provider
final logoutActionProvider = Provider<Future<void> Function()>((ref) {
  return () async {
    final repository = ref.read(authRepositoryProvider);
    await repository.logout();
    ref.read(currentUserProvider.notifier).state = null;
  };
});

/// Check if user is logged in
final isLoggedInProvider = FutureProvider<bool>((ref) async {
  final repository = ref.read(authRepositoryProvider);
  return await repository.isLoggedIn();
});

/// Get current user from backend
final fetchCurrentUserProvider = Provider<Future<void> Function()>((ref) {
  return () async {
    final repository = ref.read(authRepositoryProvider);
    final result = await repository.getCurrentUser();

    result.when(
      success: (user) {
        ref.read(currentUserProvider.notifier).state = user;
      },
      failure: (error) {
        ref.read(authErrorProvider.notifier).state = error.toString();
      },
    );
  };
});
