/// Constants for crop-specific growing tips and recommendations
class CropTipsConstants {
  CropTipsConstants._();

  static const Map<String, List<String>> cropTips = {
    'Rice': [
      'Maintain standing water of 2-3 inches during growing season',
      'Apply nitrogen fertilizer in split doses',
      'Watch for brown plant hopper and stem borer pests',
    ],
    'Wheat': [
      'Sow seeds at proper depth of 5-6 cm',
      'Irrigation is critical at tillering and grain filling stages',
      'Apply balanced NPK fertilization for better yield',
    ],
    'Maize': [
      'Ensure proper spacing of 60-75 cm between rows',
      'Side-dress nitrogen at knee-high stage',
      'Control fall armyworm and other pests regularly',
    ],
    'Cotton': [
      'Maintain soil moisture during flowering and boll formation',
      'Apply potassium for better fiber quality',
      'Watch for bollworm and whitefly infestations',
    ],
    'Sugarcane': [
      'Plant healthy seed cane from disease-free sources',
      'Apply high nitrogen and potassium fertilizers',
      'Ensure proper irrigation at tillering and grand growth phases',
    ],
    'Jute': [
      'Sow in well-drained soil with high organic matter',
      'Requires high humidity and rainfall',
      'Harvest when plants flower for best fiber quality',
    ],
  };

  static const List<String> defaultTips = [
    'Ensure proper soil preparation before planting',
    'Apply balanced fertilizers based on soil test',
    'Monitor for pests and diseases regularly',
  ];

  /// Get tips for a specific crop, or default tips if crop not found
  static List<String> getTipsForCrop(String crop) {
    return cropTips[crop] ?? defaultTips;
  }
}
