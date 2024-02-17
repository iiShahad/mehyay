import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mehyay/auth/controllers/auth_controller.dart';
import 'package:mehyay/auth/views/auth_screen.dart';
import 'package:mehyay/emergency_record/views/home_view.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: "/home",
    redirect: (context, state) {
      final userLoggingIn = state.uri.toString() == '/auth';
      bool userIsLoggedIn = false;
      ref.watch(authStateChangeProvider).whenData((value) {
        userIsLoggedIn = value != null;
      });
      print(userIsLoggedIn);
      if (userLoggingIn && userIsLoggedIn) {
        return '/home';
      } else if ((!userLoggingIn && !userIsLoggedIn)) {
        return '/auth';
      } else {
        return null;
      }
    },
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: Container(color: Colors.red),
          );
        },
      ),
      GoRoute(
        path: '/auth',
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: AuthScreen(),
          );
        },
      ),
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: HomeView(),
          );
        },
      ),
    ],
  );
});
