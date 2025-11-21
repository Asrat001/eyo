import 'package:eyo_bingo/features/admin/presentation/screens/admin_games_screen.dart';
import 'package:eyo_bingo/features/admin/presentation/screens/admin_home_screen.dart';
import 'package:eyo_bingo/features/admin/presentation/screens/all_games_screen.dart';
import 'package:eyo_bingo/features/admin/presentation/screens/create_game_screen.dart';
import 'package:eyo_bingo/features/admin/presentation/screens/game_details_screen.dart';
import 'package:eyo_bingo/features/admin/presentation/screens/super_admin_admins_screen.dart';
import 'package:eyo_bingo/features/admin/presentation/screens/super_admin_home_screen.dart';
import 'package:eyo_bingo/features/auth/presentation/screens/register_screen.dart';
import 'package:eyo_bingo/features/cartela_selection/presentation/cartela_selcetion.dart';
import 'package:eyo_bingo/features/game/presentation/game_screen.dart';
import 'package:eyo_bingo/features/home/presentation/home_screen.dart';
import 'package:eyo_bingo/features/leader_board/presentation/leader_board.dart';
import 'package:eyo_bingo/shared/routes/admin_main_screen.dart';
import 'package:eyo_bingo/shared/routes/route_names.dart';
import 'package:eyo_bingo/shared/routes/super_admin_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../features/wallet/presentation/wallet_screen.dart';
import 'main_screen.dart';

class AppRouter {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    observers: [],
    navigatorKey: navigatorKey,
    initialLocation: Routes.splashRouteName,
    routes: [
      GoRoute(
        path: Routes.splashRouteName,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: Routes.loginRouteName,
        builder: (context, state) => LoginScreen(),
      ),

      GoRoute(
        path: Routes.registerRouteName,
        builder: (context, state) => RegisterScreen(),
      ),

      GoRoute(
        path: '/cartela-selection/:pin',
        builder: (context, state) {
          final pin = state.pathParameters['pin'] ?? '';
          return CartelaSelectionScreen(pin: pin);
        },
      ),

      GoRoute(
        path: '/game/:pin/:cartela',
        builder: (context, state) {
          final pin = state.pathParameters['pin'] ?? '';
          final cartela = state.pathParameters['cartela'] ?? '';
          return GameScreen(pin: pin, cartelaNumber: cartela);
        },
      ),
      GoRoute(
        path: '/wallet',
        builder: (context, state) {
          return const WalletScreen();
        },
      ),

      GoRoute(
        path: '/admin/create-game',
        builder: (context, state) {
          return const CreateGameScreen();
        },
      ),

      GoRoute(
        path: '/admin/all-games',
        builder: (context, state) {
          return const AllGamesScreen();
        },
      ),

      GoRoute(
        path: '/admin/game-details/:gameId',
        builder: (context, state) {
          final gameId = state.pathParameters['gameId'] ?? '';
          return GameDetailsScreen(gameId: gameId);
        },
      ),

      // ============= PLAYER ROUTES =============
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.homeRouteName,
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.bibleRouteName,
                builder: (context, state) => const LeaderBoard(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.profileRouteName,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),

      // ============= ADMIN ROUTES =============
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            AdminMainScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.adminHomeRouteName,
                builder: (context, state) => const AdminHomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.adminGamesRouteName,
                builder: (context, state) => const AdminGamesScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.adminProfileRouteName,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),

      // ============= SUPER ADMIN ROUTES =============
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            SuperAdminMainScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.superAdminHomeRouteName,
                builder: (context, state) => const SuperAdminHomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.superAdminAdminsRouteName,
                builder: (context, state) => const SuperAdminAdminsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.superAdminProfileRouteName,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
    // errorBuilder: (context, state) => ErrorScreen(errorMessage: state.error.toString()),
    redirect: (context, state) {
      // TODO: Implement role-based redirect logic here
      // Example:
      // final user = ref.read(currentUserProvider);
      // if (user != null) {
      //   if (user.isSuperAdmin) {
      //     return Routes.superAdminHomeRouteName;
      //   } else if (user.isAdmin) {
      //     return Routes.adminHomeRouteName;
      //   } else {
      //     return Routes.homeRouteName;
      //   }
      // }

      return null;
    },
  );
}
