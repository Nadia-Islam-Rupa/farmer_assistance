import 'dart:async';

import 'package:farmer_assistance/application/core/services/routing/routing_utils.dart';
import 'package:farmer_assistance/application/pages/auth/log_dash.dart';
import 'package:farmer_assistance/application/pages/auth/login_page/login_page.dart';
import 'package:farmer_assistance/presentation/Home%20Dashboard/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../pages/auth/create_account_page/create_account.dart';
import '../../../pages/auth/forget_password_page/forgot_pass.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,
    // 🔹 Listen for auth changes
    refreshListenable: GoRouterRefreshStream(
      FirebaseAuth.instance.authStateChanges(),
    ),
    // 🔹 Redirect logic
    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;

      final authRoutes = [
        PAGES.loginDash.screenPath,
        PAGES.loginPage.screenPath,
        PAGES.createAccountPage.screenPath,
        PAGES.forgetPage.screenPath,
      ];
      // final isLoggingIn = state.fullPath == PAGES.loginDash.screenPath;
      final isLoggingIn = authRoutes.contains(state.fullPath);

      if (user == null) {
        // Not logged in → force to login page unless already there
        return isLoggingIn ? null : PAGES.loginDash.screenPath;
      }

      // Logged in but tries to access login page → send to bottom page
      if (isLoggingIn) return PAGES.homePage.screenPath;

      return null; // No redirection
    },
    routes: [
      GoRoute(
        path: PAGES.loginDash.screenPath,
        name: PAGES.loginDash.screenName,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: PAGES.loginPage.screenPath,
        name: PAGES.loginPage.screenName,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: PAGES.homePage.screenPath,
        name: PAGES.homePage.screenName,
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: PAGES.createAccountPage.screenPath,
        name: PAGES.createAccountPage.screenName,
        builder: (context, state) => CreateAccountPage(),
      ),
      GoRoute(
        path: PAGES.forgetPage.screenPath,
        name: PAGES.forgetPage.screenName,
        builder: (context, state) => ForgotPasswordPage(),
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
