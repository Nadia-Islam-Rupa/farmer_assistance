import 'package:farmer_assistance/application/pages/fertilizer/constants/fertilizer_constants.dart';
import 'package:farmer_assistance/application/pages/fertilizer/provider/fertilizer_provider.dart';

class FertilizerCalculationService {
  /// Calculate nitrogen requirement for a crop
  static double calculateNitrogenNeed(
    String crop,
    double current,
    String soilType,
  ) {
    final base = FertilizerConstants.nitrogenRequirements[crop] ?? 100.0;
    final factor = FertilizerConstants.nitrogenSoilFactors[soilType] ?? 1.0;
    final needed = (base * factor) - current;
    return needed > 0 ? needed : 0;
  }

  /// Calculate phosphorus requirement for a crop
  static double calculatePhosphorusNeed(
    String crop,
    double current,
    String soilType,
  ) {
    final base = FertilizerConstants.phosphorusRequirements[crop] ?? 60.0;
    final factor = FertilizerConstants.phosphorusSoilFactors[soilType] ?? 1.0;
    final needed = (base * factor) - current;
    return needed > 0 ? needed : 0;
  }

  /// Calculate potassium requirement for a crop
  static double calculatePotassiumNeed(
    String crop,
    double current,
    String soilType,
  ) {
    final base = FertilizerConstants.potassiumRequirements[crop] ?? 50.0;
    final factor = FertilizerConstants.potassiumSoilFactors[soilType] ?? 1.0;
    final needed = (base * factor) - current;
    return needed > 0 ? needed : 0;
  }

  /// Determine the best fertilizer type based on NPK needs
  static String determineFertilizerType(double n, double p, double k) {
    if (n > 100 && p > 50 && k > 50) {
      return 'Complete NPK Fertilizer';
    } else if (n > 100) {
      return 'Nitrogen-Rich Fertilizer (e.g., Urea)';
    } else if (p > 50) {
      return 'Phosphorus-Rich Fertilizer (e.g., DAP)';
    } else if (k > 50) {
      return 'Potassium-Rich Fertilizer (e.g., MOP)';
    } else if (n > 50 || p > 30 || k > 30) {
      return 'Balanced NPK Fertilizer';
    } else {
      return 'Organic Compost/Manure';
    }
  }

  /// Calculate NPK ratio from required amounts
  static String determineNPKRatio(double n, double p, double k) {
    if (n < 10 && p < 10 && k < 10) {
      return '0:0:0';
    }

    final minValue = [
      n,
      p,
      k,
    ].where((v) => v > 0).reduce((a, b) => a < b ? a : b);
    final divisor = minValue < 1 ? 1 : minValue;

    final nRatio = (n / divisor).round();
    final pRatio = (p / divisor).round();
    final kRatio = (k / divisor).round();

    // Normalize to common ratios
    if (nRatio == pRatio && pRatio == kRatio) return '1:1:1';
    if (nRatio == 2 && pRatio == 1 && kRatio == 1) return '2:1:1';
    if (nRatio == 3 && pRatio == 1 && kRatio == 2) return '3:1:2';
    if (nRatio == 1 && pRatio == 2 && kRatio == 2) return '1:2:2';

    return '$nRatio:$pRatio:$kRatio';
  }

  /// Generate application tips based on conditions
  static List<String> generateTips({
    required String crop,
    required String soilType,
    required double ph,
    required double rainfall,
    required double temperature,
  }) {
    final tips = <String>[];

    // pH-based tips
    if (ph < 6.0) {
      tips.add(
        'Soil pH is acidic (${ph.toStringAsFixed(1)}). Consider adding lime to raise pH for better nutrient availability.',
      );
    } else if (ph > 7.5) {
      tips.add(
        'Soil pH is alkaline (${ph.toStringAsFixed(1)}). Consider adding sulfur or organic matter to lower pH.',
      );
    } else {
      tips.add(
        'Soil pH is optimal (${ph.toStringAsFixed(1)}) for nutrient absorption.',
      );
    }

    // Rainfall-based tips
    if (rainfall < 20) {
      tips.add(
        'Low rainfall detected. Ensure adequate irrigation before and after fertilizer application.',
      );
    } else if (rainfall > 100) {
      tips.add(
        'High rainfall may cause nutrient leaching. Consider split applications to minimize losses.',
      );
    }

    // Temperature-based tips
    if (temperature > FertilizerConstants.highTemperature) {
      tips.add(
        'High temperature may affect nutrient uptake. Apply fertilizer during cooler hours (early morning or evening).',
      );
    } else if (temperature < FertilizerConstants.lowTemperature) {
      tips.add(
        'Cool temperature may slow nutrient absorption. Monitor crop response carefully.',
      );
    }

    // Soil type tips
    if (soilType == 'Sandy') {
      tips.add(
        'Sandy soil has low nutrient retention. Consider split applications for better efficiency.',
      );
    } else if (soilType == 'Clayey') {
      tips.add(
        'Clay soil retains nutrients well. Ensure proper drainage to prevent waterlogging.',
      );
    }

    // General tips
    tips.add(
      'Apply fertilizer at least 6 inches away from plant stems to prevent burning.',
    );

    return tips;
  }

  /// Calculate complete fertilizer recommendation
  static FertilizerResult calculateRecommendation({
    required String crop,
    required String soilType,
    required double nitrogen,
    required double phosphorus,
    required double potassium,
    required double ph,
    required double rainfall,
    required double temperature,
  }) {
    final nitrogenNeeded = calculateNitrogenNeed(crop, nitrogen, soilType);
    final phosphorusNeeded = calculatePhosphorusNeed(
      crop,
      phosphorus,
      soilType,
    );
    final potassiumNeeded = calculatePotassiumNeed(crop, potassium, soilType);

    final recommendedFertilizer = determineFertilizerType(
      nitrogenNeeded,
      phosphorusNeeded,
      potassiumNeeded,
    );

    final npkRatio = determineNPKRatio(
      nitrogenNeeded,
      phosphorusNeeded,
      potassiumNeeded,
    );

    final tips = generateTips(
      crop: crop,
      soilType: soilType,
      ph: ph,
      rainfall: rainfall,
      temperature: temperature,
    );

    return FertilizerResult(
      recommendedFertilizer: recommendedFertilizer,
      npkRatio: npkRatio,
      nitrogenNeeded: nitrogenNeeded,
      phosphorusNeeded: phosphorusNeeded,
      potassiumNeeded: potassiumNeeded,
      tips: tips,
    );
  }
}
