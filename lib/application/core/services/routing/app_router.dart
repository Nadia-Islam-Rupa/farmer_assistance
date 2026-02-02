import 'dart:async';

import 'package:farmer_assistance/application/core/services/routing/routing_utils.dart';
import 'package:farmer_assistance/application/pages/auth/log_dash.dart';
import 'package:farmer_assistance/application/pages/auth/login_page/login_page.dart';
import 'package:farmer_assistance/presentation/Home%20Dashboard/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    // // 🔹 Listen for auth changes
    // refreshListenable: GoRouterRefreshStream(
    //   FirebaseAuth.instance.authStateChanges(),
    // ),
    // // 🔹 Redirect logic
    // redirect: (context, state) {
    //   final user = FirebaseAuth.instance.currentUser;
    //   final isLoggingIn = state.fullPath == PAGES.loginDash.screenPath;
    //
    //   if (user == null) {
    //     // Not logged in → force to login page unless already there
    //     return isLoggingIn ? null : PAGES.loginDash.screenPath;
    //   }
    //
    //   // Logged in but tries to access login page → send to bottom page
    //   if (isLoggingIn) return PAGES.homePage.screenPath;
    //
    //   return null; // No redirection
    // },
    routes: [
      GoRoute(
        path: PAGES.loginDash.screenPath,
        name: PAGES.loginDash.screenName,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: PAGES.loginPage.screenPath,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: PAGES.homePage.screenPath,
        name: PAGES.homePage.screenName,
        builder: (context, state) => HomePage(),
      ),
    ],
  );

  static GoRouter get router => _router;
}

/// 🔹 Helper to refresh router on FirebaseAuth changes
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
