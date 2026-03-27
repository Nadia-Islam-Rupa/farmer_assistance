class FertilizerConstants {
  // Crop types
  static const List<String> crops = [
    'Sugarcane',
    'Wheat',
    'Cotton',
    'Jowar',
    'Maize',
    'Rice',
    'Groundnut',
    'Tur',
    'Grapes',
    'Ginger',
    'Urad',
    'Moong',
    'Gram',
    'Turmeric',
    'Soybean',
    'Masoor'
  ];

  // Soil types
  static const List<String> soilTypes = [
    'Black',
    'Red',
    'Dark Brown',
    'Reddish Brown',
    'Light Brown',
    'Medium Brown'
  ];

  // Nitrogen base requirements by crop (kg/ha)
  static const Map<String, double> nitrogenRequirements = {
    'Rice': 120.0,
    'Wheat': 120.0,
    'Maize': 150.0,
    'Sugarcane': 180.0,
    'Cotton': 120.0,
    'Potato': 150.0,
    'Tomato': 140.0,
    'Onion': 100.0,
    'Chickpea': 25.0,
    'Groundnut': 25.0,
  };

  // Phosphorus base requirements by crop (kg/ha)
  static const Map<String, double> phosphorusRequirements = {
    'Rice': 60.0,
    'Wheat': 60.0,
    'Maize': 60.0,
    'Sugarcane': 80.0,
    'Cotton': 60.0,
    'Potato': 80.0,
    'Tomato': 70.0,
    'Onion': 50.0,
    'Chickpea': 60.0,
    'Groundnut': 60.0,
  };

  // Potassium base requirements by crop (kg/ha)
  static const Map<String, double> potassiumRequirements = {
    'Rice': 40.0,
    'Wheat': 40.0,
    'Maize': 40.0,
    'Sugarcane': 60.0,
    'Cotton': 60.0,
    'Potato': 100.0,
    'Tomato': 80.0,
    'Onion': 60.0,
    'Chickpea': 40.0,
    'Groundnut': 50.0,
  };

  // Soil factors for nitrogen
  static const Map<String, double> nitrogenSoilFactors = {
    'Sandy': 1.2,
    'Loamy': 1.0,
    'Black': 0.9,
    'Red': 1.1,
    'Clayey': 0.95,
    'Alluvial': 1.0,
  };

  // Soil factors for phosphorus
  static const Map<String, double> phosphorusSoilFactors = {
    'Sandy': 1.15,
    'Loamy': 1.0,
    'Black': 0.95,
    'Red': 1.1,
    'Clayey': 1.0,
    'Alluvial': 1.0,
  };

  // Soil factors for potassium
  static const Map<String, double> potassiumSoilFactors = {
    'Sandy': 1.2,
    'Loamy': 1.0,
    'Black': 0.9,
    'Red': 1.1,
    'Clayey': 0.95,
    'Alluvial': 1.0,
  };

  // Threshold values
  static const double lowMoisture = 30.0;
  static const double highMoisture = 70.0;
  static const double highTemperature = 35.0;
  static const double lowTemperature = 15.0;
}
