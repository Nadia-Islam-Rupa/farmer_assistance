import 'dart:async';

import 'package:farmer_assistance/application/core/services/routing/routing_utils.dart';
import 'package:farmer_assistance/application/pages/auth/log_dash.dart';
import 'package:farmer_assistance/application/pages/auth/login_page/login_page.dart';
import 'package:farmer_assistance/domain/models/Crop_disease_model.dart';
import 'package:farmer_assistance/presentation/Home%20Dashboard/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../pages/auth/create_account_page/create_account.dart';
import '../../../pages/auth/forget_password_page/forgot_pass.dart';
import '../../../pages/crop_disease_detection/crop_disease_result_screen.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,

    // 🔹 Supabase auth listener
    refreshListenable: GoRouterRefreshSupabase(),

    redirect: (context, state) {
      final session = Supabase.instance.client.auth.currentSession;
      final user = session?.user;

      final authRoutes = [
        PAGES.loginDash.screenPath,
        PAGES.loginPage.screenPath,
        PAGES.createAccountPage.screenPath,
        PAGES.forgetPage.screenPath,
      ];

      final isLoggingIn = authRoutes.contains(state.fullPath);

      if (user == null) {
        // Not logged in
        return isLoggingIn ? null : PAGES.loginDash.screenPath;
      }

      // Logged in but accessing auth pages
      if (isLoggingIn) return PAGES.homePage.screenPath;

      return null;
    },

    routes: [
      GoRoute(
        path: PAGES.loginDash.screenPath,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: PAGES.loginPage.screenPath,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: PAGES.homePage.screenPath,
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: PAGES.createAccountPage.screenPath,
        builder: (context, state) => CreateAccountPage(),
      ),
      GoRoute(
        path: PAGES.forgetPage.screenPath,
        builder: (context, state) => ForgotPasswordPage(),
      ),
      GoRoute(
        path: PAGES.cropDiseaseDetectionResult.screenPath,
        name: PAGES.cropDiseaseDetectionResult.screenName,
        builder: (context, state) {
          final args = state.extra as CropDiseaseModel;
          return CropDiseaseResultScreen(cropDiseaseModel: args);
        },
      ),
    ],
  );

  static GoRouter get router => _router;
}

class GoRouterRefreshSupabase extends ChangeNotifier {
  late final StreamSubscription _subscription;

  GoRouterRefreshSupabase() {
    _subscription = Supabase.instance.client.auth.onAuthStateChange.listen((
      data,
    ) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // AppRouter.router.refresh();
        notifyListeners();
      });
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
