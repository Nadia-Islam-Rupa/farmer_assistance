enum PAGES {
  homePage,
  loginDash,
  loginPage,
  createAccountPage,
  forgetPage,
  cropDiseasePrediction,
  cropDiseaseDetectionResult,
  smartIrrigationPage,
  fertilizerRecommendationPage,
  marketTrendsPage,
  forecastPage,
  yieldPredictionPage,
  cropRecommendationPage,
}

extension AppPageExtention on PAGES {
  String get screenPath {
    switch (this) {
      case PAGES.homePage:
        return '/homePage';
      case PAGES.loginPage:
        return '/loginPage';
      case PAGES.createAccountPage:
        return '/createAccountPage';
      case PAGES.forgetPage:
        return '/forgotPage';
      case PAGES.loginDash:
        return '/';
      case PAGES.cropDiseasePrediction:
        return '/cropDiseasePrediction';
      case PAGES.cropDiseaseDetectionResult:
        return '/cropDiseaseDetectionResult';
      case PAGES.smartIrrigationPage:
        return '/smartIrrigationPage';
      case PAGES.fertilizerRecommendationPage:
        return '/fertilizerRecommendationPage';
      case PAGES.marketTrendsPage:
        return '/marketTrendsPage';
      case PAGES.forecastPage:
        return '/forecastPage';
      case PAGES.yieldPredictionPage:
        return '/yieldPredictionPage';
      case PAGES.cropRecommendationPage:
        return '/cropRecommendationPage';
    }
  }

  String get screenName {
    switch (this) {
      case PAGES.homePage:
        return 'HomePage';
      case PAGES.loginPage:
        return 'LoginPage';
      case PAGES.createAccountPage:
        return 'Create Account';
      case PAGES.forgetPage:
        return 'Forgot Password';
      case PAGES.loginDash:
        return 'LoginDash';
      case PAGES.cropDiseasePrediction:
        return 'Crop Disease Prediction';
      case PAGES.cropDiseaseDetectionResult:
        return 'Crop Disease Detection Result';
      case PAGES.smartIrrigationPage:
        return 'Smart Irrigation';
      case PAGES.fertilizerRecommendationPage:
        return 'Fertilizer Recommendation';
      case PAGES.marketTrendsPage:
        return 'Market Trends';
      case PAGES.forecastPage:
        return 'Forecast';
      case PAGES.yieldPredictionPage:
        return 'Yield Prediction';
      case PAGES.cropRecommendationPage:
        return 'Crop Recommendation';
    }
  }
}
