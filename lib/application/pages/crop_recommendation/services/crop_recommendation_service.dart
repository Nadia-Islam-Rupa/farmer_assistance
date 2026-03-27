import 'package:farmer_assistance/application/pages/crop_recommendation/constants/crop_tips_constants.dart';
import 'package:farmer_assistance/application/pages/crop_recommendation/models/crop_recommendation_result.dart';

/// Service for handling crop recommendation logic
class CropRecommendationService {
  CropRecommendationService._();

  /// Generate a crop recommendation based on input parameters
  ///
  /// This is currently using dummy logic for demonstration.
  /// Replace with actual API call in production.
  static Future<CropRecommendationResult> getRecommendation({
    required double nitrogen,
    required double phosphorus,
    required double potassium,
    required double ph,
    required double temperature,
    required double humidity,
    required double rainfall,
    String? soilType,
  }) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));

    final recommendedCrop = _determineCrop(
      nitrogen: nitrogen,
      phosphorus: phosphorus,
      potassium: potassium,
      ph: ph,
      temperature: temperature,
      humidity: humidity,
      rainfall: rainfall,
    );

    return CropRecommendationResult(
      cropName: recommendedCrop,
      confidence: 0.85,
      tips: CropTipsConstants.getTipsForCrop(recommendedCrop),
      inputData: {
        'nitrogen': nitrogen,
        'phosphorus': phosphorus,
        'potassium': potassium,
        'ph': ph,
        'temperature': temperature,
        'humidity': humidity,
        'rainfall': rainfall,
        'soil_type': soilType,
      },
    );
  }

  /// Determine the recommended crop based on soil and weather conditions
  ///
  /// This uses simplified logic for demonstration purposes.
  /// In production, this should be replaced with ML model or API call.
  static String _determineCrop({
    required double nitrogen,
    required double phosphorus,
    required double potassium,
    required double ph,
    required double temperature,
    required double humidity,
    required double rainfall,
  }) {
    if (rainfall > 200 && humidity > 80) {
      return 'Rice';
    } else if (temperature < 25 && rainfall < 100) {
      return 'Wheat';
    } else if (nitrogen > 80 && potassium > 40) {
      return 'Sugarcane';
    } else if (temperature > 30 && rainfall > 150) {
      return 'Cotton';
    } else if (ph > 6.5 && ph < 7.5) {
      return 'Maize';
    } else if (humidity > 70) {
      return 'Jute';
    } else {
      return 'Wheat';
    }
  }
}
