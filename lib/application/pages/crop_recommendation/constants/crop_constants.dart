class CropConstants {
  // List of crops for dropdown
  static const List<String> crops = [
    'Rice',
    'Wheat',
    'Maize',
    'Cotton',
    'Jute',
    'Sugarcane',
    'Tea',
    'Coffee',
    'Chickpea',
    'Kidney Beans',
    'Pigeon Peas',
    'Moth Beans',
    'Mung Bean',
    'Black Gram',
    'Lentil',
    'Pomegranate',
    'Banana',
    'Mango',
    'Grapes',
    'Watermelon',
    'Muskmelon',
    'Apple',
    'Orange',
    'Papaya',
    'Coconut',
  ];

  // Soil types
  static const List<String> soilTypes = [
    'Sandy',
    'Loamy',
    'Black',
    'Red',
    'Clayey',
  ];

  // Crop emoji mapping
  static const Map<String, String> cropEmojis = {
    'Rice': '🌾',
    'Wheat': '🌾',
    'Maize': '🌽',
    'Cotton': '🌱',
    'Jute': '🌿',
    'Sugarcane': '🎋',
    'Tea': '🍵',
    'Coffee': '☕',
    'Chickpea': '🫘',
    'Kidney Beans': '🫘',
    'Pigeon Peas': '🫘',
    'Moth Beans': '🫘',
    'Mung Bean': '🫘',
    'Black Gram': '🫘',
    'Lentil': '🫘',
    'Pomegranate': '🍎',
    'Banana': '🍌',
    'Mango': '🥭',
    'Grapes': '🍇',
    'Watermelon': '🍉',
    'Muskmelon': '🍈',
    'Apple': '🍎',
    'Orange': '🍊',
    'Papaya': '🥭',
    'Coconut': '🥥',
  };

  // Validation ranges
  static const double minNitrogen = 0;
  static const double maxNitrogen = 140;
  static const double minPhosphorus = 5;
  static const double maxPhosphorus = 145;
  static const double minPotassium = 5;
  static const double maxPotassium = 205;
  static const double minPH = 3.5;
  static const double maxPH = 10;
  static const double minRainfall = 20;
  static const double maxRainfall = 300;

  // Helper method to get crop emoji
  static String getCropEmoji(String cropName) {
    return cropEmojis[cropName] ?? '🌱';
  }
}
