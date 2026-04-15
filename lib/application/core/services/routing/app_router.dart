import 'dart:async';

import 'package:farmer_assistance/application/core/services/routing/routing_utils.dart';
import 'package:farmer_assistance/application/pages/auth/log_dash.dart';
import 'package:farmer_assistance/application/pages/auth/login_page/login_page.dart';
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
import '../../../pages/profile/personal_information_page.dart';
import '../../../pages/water_prediction/prediction_water.dart';
import '../../../pages/yield_prediction/yield_page.dart';

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
