
import 'package:eyo_bingo/features/auth/presentation/screens/register_screen.dart';
import 'package:eyo_bingo/features/game/presentation/game_screen.dart';
import 'package:eyo_bingo/features/home/presentation/home_screen.dart';
import 'package:eyo_bingo/features/leader_board/presentation/leader_board.dart';
import 'package:eyo_bingo/shared/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';
import 'main_screen.dart';

class AppRouter  {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
 late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    observers: [],
    navigatorKey: navigatorKey,
    initialLocation:Routes.splashRouteName,
    routes: [
      GoRoute(
        path: Routes.splashRouteName,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: Routes.loginRouteName,
        builder: (context, state) =>  LoginScreen(),
      ),

      GoRoute(
        path: Routes.registerRouteName,
        builder: (context, state) =>  RegisterScreen(),
      ),

      GoRoute(
        path: '/game',
        builder: (context, state) => const GameScreen(),
      ),

     StatefulShellRoute.indexedStack(
       builder: (context, state, navigationShell) => MainScreen(navigationShell: navigationShell),
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
         ]
     )
    ],
    // errorBuilder: (context, state) => ErrorScreen(errorMessage: state.error.toString()),
    redirect: (context, state) {

     return null;
    },



  );


}