import 'dart:async';

import 'package:farmer_assistance/application/core/services/deep_link/deep_link_service.dart';
import 'package:farmer_assistance/application/core/services/routing/routing_utils.dart';
import 'package:farmer_assistance/application/pages/auth/log_dash.dart';
import 'package:farmer_assistance/application/pages/auth/login_page/login_page.dart';
import 'package:farmer_assistance/application/pages/auth/reset_password_page/reset_password_page.dart';
import 'package:farmer_assistance/application/pages/bottom_nav_page/main_scaffold.dart';
import 'package:farmer_assistance/domain/models/Crop_disease_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../pages/auth/create_account_page/create_account.dart';
import '../../../pages/auth/forget_password_page/forgot_pass.dart';
import '../../../pages/crop_disease_detection/crop_disease_result_screen.dart';
import '../../../pages/crop_disease_detection/disease_upload.dart';
import '../../../pages/crop_recommendation/crop_recommendation_page.dart';
import '../../../pages/fertilizer/fertilizer_page.dart';
import '../../../pages/forcast/forecast_page.dart';
import '../../../pages/market_trends/market_trends_page.dart';
import '../../../pages/profile/about_page.dart';
import '../../../pages/profile/help_support_page.dart';
import '../../../pages/profile/personal_information_page.dart';
import '../../../pages/profile/privacy_policy_page.dart';
import '../../../pages/water_prediction/prediction_water.dart';
import '../../../pages/yield_prediction/yield_page.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _refreshListenable = GoRouterRefreshSupabase();

  /// Exposed so DeepLinkService can trigger a router re-evaluation.
  static GoRouterRefreshSupabase get refreshListenable => _refreshListenable;

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: rootNavigatorKey,

    refreshListenable: _refreshListenable,

    redirect: (context, state) {
      final session = Supabase.instance.client.auth.currentSession;
      final user = session?.user;

      // Once we've landed on the reset-password page, clear the deep-link flag
      // so normal auth guards take over from here.
      if (state.fullPath == PAGES.resetPasswordPage.screenPath) {
        DeepLinkService.consumePendingRecovery();
      }

      // Once we've landed on the login page after email verification, clear the
      // flag so normal auth guards take over from here.
      if (state.fullPath == PAGES.loginPage.screenPath) {
        DeepLinkService.consumePendingEmailVerification();
      }

      // Recovery from either Supabase's built-in event (app was open) OR
      // our deep-link handler (cold/background start).
      final isRecovery =
          _refreshListenable.lastEvent == AuthChangeEvent.passwordRecovery ||
          DeepLinkService.hasPendingRecovery;

      if (isRecovery && state.fullPath != PAGES.resetPasswordPage.screenPath) {
        return PAGES.resetPasswordPage.screenPath;
      }

      // Email verification: send the user directly to the login page (not the
      // login-dash) so they can sign in immediately after confirming their email.
      if (DeepLinkService.hasPendingEmailVerification &&
          state.fullPath != PAGES.loginPage.screenPath) {
        return PAGES.loginPage.screenPath;
      }

      final authRoutes = [
        PAGES.loginDash.screenPath,
        PAGES.loginPage.screenPath,
        PAGES.createAccountPage.screenPath,
        PAGES.forgetPage.screenPath,
      ];

      final isAuthRoute = authRoutes.contains(state.fullPath);

      if (user == null) {
        // Unauthenticated: allow auth routes, redirect everything else (including
        // resetPasswordPage when session is gone after sign-out) to login dash.
        return isAuthRoute ? null : PAGES.loginDash.screenPath;
      }

      // Authenticated but on an auth route → go to home.
      if (isAuthRoute) return PAGES.homePage.screenPath;

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
        builder: (context, state) => MainScaffold(),
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
        path: PAGES.resetPasswordPage.screenPath,
        builder: (context, state) => const ResetPasswordPage(),
      ),
      GoRoute(
        path: PAGES.cropDiseasePrediction.screenPath,
        name: PAGES.cropDiseasePrediction.screenName,
        builder: (context, state) => const UploadLeafScreen(),
      ),

      GoRoute(
        path: PAGES.cropDiseaseDetectionResult.screenPath,
        name: PAGES.cropDiseaseDetectionResult.screenName,
        builder: (context, state) {
          final args = state.extra as CropDiseaseModel;
          return CropDiseaseResultScreen(cropDiseaseModel: args);
        },
      ),
      GoRoute(
        path: PAGES.smartIrrigationPage.screenPath,
        name: PAGES.smartIrrigationPage.screenName,
        builder: (context, state) => const IrrigationPage(),
      ),
      GoRoute(
        path: PAGES.fertilizerRecommendationPage.screenPath,
        name: PAGES.fertilizerRecommendationPage.screenName,
        builder: (context, state) => const FertilizerRecommendationPage(),
      ),
      GoRoute(
        path: PAGES.marketTrendsPage.screenPath,
        name: PAGES.marketTrendsPage.screenName,
        builder: (context, state) => const MarketTrendsPage(),
      ),
      GoRoute(
        path: PAGES.forecastPage.screenPath,
        name: PAGES.forecastPage.screenName,
        builder: (context, state) => const ForecastPage(),
      ),
      GoRoute(
        path: PAGES.yieldPredictionPage.screenPath,
        name: PAGES.yieldPredictionPage.screenName,
        builder: (context, state) => const YieldPredictionPage(),
      ),
      GoRoute(
        path: PAGES.cropRecommendationPage.screenPath,
        name: PAGES.cropRecommendationPage.screenName,
        builder: (context, state) => const CropRecommendationPage(),
      ),
      GoRoute(
        path: PAGES.updateProfilePage.screenPath,
        name: PAGES.updateProfilePage.screenName,
        builder: (context, state) => const PersonalInformationPage(),
      ),
      GoRoute(
        path: PAGES.helpSupportPage.screenPath,
        name: PAGES.helpSupportPage.screenName,
        builder: (context, state) => const HelpSupportPage(),
      ),
      GoRoute(
        path: PAGES.aboutPage.screenPath,
        name: PAGES.aboutPage.screenName,
        builder: (context, state) => const AboutPage(),
      ),
      GoRoute(
        path: PAGES.privacyPolicyPage.screenPath,
        name: PAGES.privacyPolicyPage.screenName,
        builder: (context, state) => const PrivacyPolicyPage(),
      ),
    ],
  );

  static GoRouter get router => _router;
}

class GoRouterRefreshSupabase extends ChangeNotifier {
  late final StreamSubscription _subscription;
  AuthChangeEvent? _lastEvent;

  AuthChangeEvent? get lastEvent => _lastEvent;

  GoRouterRefreshSupabase() {
    _subscription = Supabase.instance.client.auth.onAuthStateChange.listen((
      data,
    ) {
      _lastEvent = data.event;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    });
  }

  /// Called by DeepLinkService on hot start to force an immediate redirect
  /// re-evaluation without waiting for an auth-state-change event.
  void triggerRefresh() => notifyListeners();

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
