/// ALL values in this file are verified directly from the WFP Bangladesh
/// food prices dataset. No invented or approximate values.
class PricePredictionConstants {
  // ==================== DIVISIONS (admin1) — 8 exact ====================
  static const List<String> divisions = [
    'Barisal',
    'Chittagong',
    'Dhaka',
    'Khulna',
    'Mymensingh',
    'Rajshahi',
    'Rangpur',
    'Sylhet',
  ];

  // ==================== DISTRICTS (admin2) per division ====================
  // Exact spelling as in dataset
  static const Map<String, List<String>> districtsByDivision = {
    'Barisal': [
      'Barguna',
      'Barisal',
      'Bhola',
      'Jhalokati',
      'Pirojpur',
    ],
    'Chittagong': [
      'Bandarban',
      'Brahamanbaria',
      'Chandpur',
      'Chittagong',
      'Comilla',
      "Cox'S Bazar",
      'Feni',
      'Khagrachhari',
      'Lakshmipur',
      'Noakhali',
      'Rangamati',
    ],
    'Dhaka': [
      'Dhaka',
      'Faridpur',
      'Gazipur',
      'Gopalganj',
      'Kishoreganj',
      'Madaripur',
      'Manikganj',
      'Munshiganj',
      'Narayanganj',
      'Narsingdi',
      'Rajbari',
      'Shariatpur',
      'Tangail',
    ],
    'Khulna': [
      'Bagerhat',
      'Chuadanga',
      'Jessore',
      'Jhenaidah',
      'Khulna',
      'Kushtia',
      'Magura',
      'Meherpur',
      'Narail',
      'Satkhira',
    ],
    'Mymensingh': [
      'Jamalpur',
      'Mymensingh',
      'Netrakona',
      'Sherpur',
    ],
    'Rajshahi': [
      'Bogra',
      'Joypurhat',
      'Naogaon',
      'Natore',
      'Nawabganj',
      'Pabna',
      'Rajshahi',
      'Sirajganj',
    ],
    'Rangpur': [
      'Dinajpur',
      'Gaibandha',
      'Kurigram',
      'Lalmonirhat',
      'Nilphamari',
      'Panchagarh',
      'Rangpur',
      'Thakurgaon',
    ],
    'Sylhet': [
      'Habiganj',
      'Maulvibazar',
      'Sunamganj',
      'Sylhet',
    ],
  };

  // ==================== MARKETS per district ====================
  // Exact spelling as in dataset — these are the ONLY valid market names
  static const Map<String, List<String>> marketsByDistrict = {
    // Barisal division
    'Barguna':      ['Barguna Sadar'],
    'Barisal':      ['Barisal Division', 'Barisal Sadar'],
    'Bhola':        ['Bhola Sadar'],
    'Jhalokati':    ['Jhalokati Sadar', 'Patuakhali Sadar'],
    'Pirojpur':     ['Pirojpur Sadar'],
    // Chittagong division
    'Bandarban':    ['Bandarban Sadar'],
    'Brahamanbaria':['Brahmonbaria Sadar'],
    'Chandpur':     ['Chandpur Sadar'],
    'Chittagong':   ['Bhashan Char', 'Chittagong Division', 'Chittagong Sadar', 'Patiya Sadar'],
    'Comilla':      ['Comilla Sadar'],
    "Cox'S Bazar":  ['Cox`s Bazar Sadar', 'Teknaf Market', 'Ukhia Market'],
    'Feni':         ['Feni Sadar'],
    'Khagrachhari': ['Khagrachari Sadar'],
    'Lakshmipur':   ['Laxmipur Sadar'],
    'Noakhali':     ['Noakhali Sadar'],
    'Rangamati':    ['Rangamati Sadar'],
    // Dhaka division
    'Dhaka':        ['Dhaka', 'Dhaka Division', 'Dhaka Sadar'],
    'Faridpur':     ['Faridpur Sadar'],
    'Gazipur':      ['Gazipur Sadar'],
    'Gopalganj':    ['Gopalgonj Sadar'],
    'Kishoreganj':  ['Kishoregonj Sadar'],
    'Madaripur':    ['Madaripur Sadar'],
    'Manikganj':    ['Manikganj Sadar'],
    'Munshiganj':   ['Munshiganj Sadar'],
    'Narayanganj':  ['Narayanganj Sadar'],
    'Narsingdi':    ['Narsingdi Sadar'],
    'Rajbari':      ['Rajbari Sadar'],
    'Shariatpur':   ['Shariatpur Sadar'],
    'Tangail':      ['Tangail sadar Market'],
    // Khulna division
    'Bagerhat':     ['Bagerhat Sadar'],
    'Chuadanga':    ['Chuadanga Sadar'],
    'Jessore':      ['Jessore Sadar'],
    'Jhenaidah':    ['Jhenaidah Sadar'],
    'Khulna':       ['Khulna Division', 'Khulna Sadar'],
    'Kushtia':      ['Kushtia Sadar'],
    'Magura':       ['Magura Sadar'],
    'Meherpur':     ['Meherpur Sadar'],
    'Narail':       ['Narail Sadar'],
    'Satkhira':     ['Satkhira Sadar'],
    // Mymensingh division
    'Jamalpur':     ['Jamalpur Sadar'],
    'Mymensingh':   ['Mymensing Sadar'],
    'Netrakona':    ['Netrakona Sadar'],
    'Sherpur':      ['Sherpur Sadar'],
    // Rajshahi division
    'Bogra':        ['Bogra Sadar'],
    'Joypurhat':    ['Jaipurhat Sadar'],
    'Naogaon':      ['Naogaon Sadar'],
    'Natore':       ['Natore Sadar'],
    'Nawabganj':    ['Nawabgonj Sadar'],
    'Pabna':        ['Pabna Sadar'],
    'Rajshahi':     ['Rajshahi Division', 'Rajshahi Sadar'],
    'Sirajganj':    ['Sirajgonj Sadar'],
    // Rangpur division
    'Dinajpur':     ['Dinajpur Sadar'],
    'Gaibandha':    ['Gaibandha Sadar'],
    'Kurigram':     ['Kurigram Sadar'],
    'Lalmonirhat':  ['Lalmonirhat Sadar'],
    'Nilphamari':   ['Nilphamari Sadar'],
    'Panchagarh':   ['Panchagarh Sadar'],
    'Rangpur':      ['Rangpur Municipality Market', 'Rangpur Sadar'],
    'Thakurgaon':   ['Thakurgaon Sadar'],
    // Sylhet division
    'Habiganj':     ['Habigonj Sadar'],
    'Maulvibazar':  ['Maulavibazar Sadar'],
    'Sunamganj':    ['Sunamgonj Sadar'],
    'Sylhet':       ['Sylhet Division', 'Sylhet Sadar'],
  };

  // ==================== MARKET COORDINATES ====================
  // Exact lat/lon from dataset — auto-fill when market is selected
  static const Map<String, Map<String, double>> marketCoordinates = {
    'Bagerhat Sadar':           {'lat': 22.67, 'lon': 89.79},
    'Bandarban Sadar':          {'lat': 22.22, 'lon': 92.22},
    'Barguna Sadar':            {'lat': 22.16, 'lon': 90.12},
    'Barisal Division':         {'lat': 22.70, 'lon': 90.37},
    'Barisal Sadar':            {'lat': 22.71, 'lon': 90.36},
    'Bhashan Char':             {'lat': 22.33, 'lon': 91.16},
    'Bhola Sadar':              {'lat': 22.69, 'lon': 90.64},
    'Bogra Sadar':              {'lat': 24.85, 'lon': 89.37},
    'Brahmonbaria Sadar':       {'lat': 23.98, 'lon': 91.11},
    'Chandpur Sadar':           {'lat': 23.24, 'lon': 90.66},
    'Chittagong Division':      {'lat': 22.33, 'lon': 91.84},
    'Chittagong Sadar':         {'lat': 22.57, 'lon': 91.81},
    'Chuadanga Sadar':          {'lat': 23.59, 'lon': 88.94},
    'Comilla Sadar':            {'lat': 23.49, 'lon': 91.18},
    'Cox`s Bazar Sadar':        {'lat': 21.47, 'lon': 91.98},
    'Dhaka':                    {'lat': 23.81, 'lon': 90.41},
    'Dhaka Division':           {'lat': 23.72, 'lon': 90.41},
    'Dhaka Sadar':              {'lat': 23.73, 'lon': 90.38},
    'Dinajpur Sadar':           {'lat': 25.62, 'lon': 88.64},
    'Faridpur Sadar':           {'lat': 23.59, 'lon': 89.81},
    'Feni Sadar':               {'lat': 23.01, 'lon': 91.40},
    'Gaibandha Sadar':          {'lat': 25.33, 'lon': 89.55},
    'Gazipur Sadar':            {'lat': 24.00, 'lon': 90.42},
    'Gopalgonj Sadar':          {'lat': 23.01, 'lon': 89.83},
    'Habigonj Sadar':           {'lat': 24.37, 'lon': 91.42},
    'Jaipurhat Sadar':          {'lat': 25.10, 'lon': 89.03},
    'Jamalpur Sadar':           {'lat': 24.93, 'lon': 89.95},
    'Jessore Sadar':            {'lat': 23.16, 'lon': 89.23},
    'Jhalokati Sadar':          {'lat': 22.70, 'lon': 90.20},
    'Jhenaidah Sadar':          {'lat': 23.54, 'lon': 89.17},
    'Khagrachari Sadar':        {'lat': 23.11, 'lon': 91.98},
    'Khulna Division':          {'lat': 22.82, 'lon': 89.56},
    'Khulna Sadar':             {'lat': 22.81, 'lon': 89.55},
    'Kishoregonj Sadar':        {'lat': 24.46, 'lon': 90.78},
    'Kurigram Sadar':           {'lat': 25.81, 'lon': 89.65},
    'Kushtia Sadar':            {'lat': 23.89, 'lon': 89.09},
    'Lalmonirhat Sadar':        {'lat': 25.91, 'lon': 89.45},
    'Laxmipur Sadar':           {'lat': 22.94, 'lon': 90.83},
    'Madaripur Sadar':          {'lat': 23.17, 'lon': 90.14},
    'Magura Sadar':             {'lat': 23.49, 'lon': 89.42},
    'Manikganj Sadar':          {'lat': 23.87, 'lon': 90.03},
    'Maulavibazar Sadar':       {'lat': 24.49, 'lon': 91.76},
    'Meherpur Sadar':           {'lat': 23.77, 'lon': 88.63},
    'Munshiganj Sadar':         {'lat': 23.55, 'lon': 90.53},
    'Mymensing Sadar':          {'lat': 24.75, 'lon': 90.41},
    'Naogaon Sadar':            {'lat': 24.81, 'lon': 88.94},
    'Narail Sadar':             {'lat': 23.16, 'lon': 89.51},
    'Narayanganj Sadar':        {'lat': 23.62, 'lon': 90.50},
    'Narsingdi Sadar':          {'lat': 23.94, 'lon': 90.73},
    'Natore Sadar':             {'lat': 24.41, 'lon': 88.98},
    'Nawabgonj Sadar':          {'lat': 24.60, 'lon': 88.28},
    'Netrakona Sadar':          {'lat': 24.88, 'lon': 90.73},
    'Nilphamari Sadar':         {'lat': 25.85, 'lon': 88.87},
    'Noakhali Sadar':           {'lat': 22.89, 'lon': 91.11},
    'Pabna Sadar':              {'lat': 24.01, 'lon': 89.24},
    'Panchagarh Sadar':         {'lat': 26.33, 'lon': 88.56},
    'Patiya Sadar':             {'lat': 22.30, 'lon': 91.98},
    'Patuakhali Sadar':         {'lat': 22.72, 'lon': 90.25},
    'Pirojpur Sadar':           {'lat': 22.58, 'lon': 89.97},
    'Rajbari Sadar':            {'lat': 23.77, 'lon': 89.65},
    'Rajshahi Division':        {'lat': 24.37, 'lon': 88.60},
    'Rajshahi Sadar':           {'lat': 24.37, 'lon': 88.60},
    'Rangamati Sadar':          {'lat': 22.67, 'lon': 92.19},
    'Rangpur Municipality Market': {'lat': 25.75, 'lon': 89.25},
    'Rangpur Sadar':            {'lat': 25.75, 'lon': 89.25},
    'Satkhira Sadar':           {'lat': 22.71, 'lon': 89.07},
    'Shariatpur Sadar':         {'lat': 23.22, 'lon': 90.35},
    'Sherpur Sadar':            {'lat': 25.02, 'lon': 90.01},
    'Sirajgonj Sadar':          {'lat': 24.46, 'lon': 89.70},
    'Sunamgonj Sadar':          {'lat': 25.07, 'lon': 91.40},
    'Sylhet Division':          {'lat': 24.90, 'lon': 91.87},
    'Sylhet Sadar':             {'lat': 24.89, 'lon': 91.87},
    'Tangail sadar Market':     {'lat': 24.25, 'lon': 89.91},
    'Teknaf Market':            {'lat': 20.87, 'lon': 92.30},
    'Thakurgaon Sadar':         {'lat': 26.02, 'lon': 88.47},
    'Ukhia Market':             {'lat': 21.24, 'lon': 92.14},
  };

  // ==================== CATEGORIES — 8 exact ====================
  static const List<String> categories = [
    'cereals and tubers',
    'meat, fish and eggs',
    'milk and dairy',
    'miscellaneous food',
    'non-food',
    'oil and fats',
    'pulses and nuts',
    'vegetables and fruits',
  ];

  // ==================== COMMODITIES per category ====================
  // 72 exact names from dataset — wrong name = wrong model prediction
  static const Map<String, List<String>> commoditiesByCategory = {
    'cereals and tubers': [
      'Potatoes (Holland, white)',
      'Rice (BRRI-28)',
      'Rice (BRRI-29)',
      'Rice (BRRI-49)',
      'Rice (Gazi)',
      'Rice (Kajla)',
      'Rice (Nurjahan)',
      'Rice (Pyzam)',
      'Rice (coarse)',
      'Rice (coarse, BR-8/ 11/, Guti Sharna)',
      'Rice (coarse, Guti Sharna)',
      'Rice (medium grain)',
      'Wheat',
      'Wheat flour',
    ],
    'meat, fish and eggs': [
      'Eggs (brown)',
      'Eggs (white)',
      'Fish (dry, belt 10-12")',
      'Fish (live, pangasius)',
      'Fish (live, tilapia)',
      'Fish (tilapia, fresh)',
      'Meat (beef)',
      'Meat (chicken, broiler)',
      'Meat (chicken, sonali)',
    ],
    'milk and dairy': [
      'Milk',
      'Milk (powder)',
    ],
    'miscellaneous food': [
      'Chili (whole, dry, Indian Teja)',
      'Hyacinth (sim)',
      'Salt (iodized, Molla)',
      'Sugar',
      'Turmeric (powder, Fresh)',
    ],
    'non-food': [
      'Bathing soap',
      'Dishwashing liquid',
      'Firewood',
      'Fuel (diesel)',
      'Fuel (gas)',
      'Fuel (kerosene)',
      'Fuel (petrol)',
      'Handwash soap',
      'Laundry detergent',
      'Sanitary pads',
      'Toilet paper',
      'Toothpaste',
    ],
    'oil and fats': [
      'Oil (mustard)',
      'Oil (palm)',
      'Oil (soybean, fortified)',
    ],
    'pulses and nuts': [
      'Beans (mung, large grain)',
      'Chickpeas',
      'Lentils (masur)',
    ],
    'vegetables and fruits': [
      'Apples (royal gala)',
      'Bananas (green)',
      'Bananas (ripe)',
      'Cabbage',
      'Carrots',
      'Cauliflower',
      'Chili (green)',
      'Cucumber (short, khira)',
      'Eggplants',
      'Garlic (imported, China)',
      'Ginger (imported)',
      'Ginger (local)',
      'Gourd (bitter)',
      'Gourd (bottle)',
      'Lemon (medium size)',
      'Onions (imported, China)',
      'Onions (imported, India)',
      'Oranges (malta)',
      'Papaya (green)',
      'Pumpkin',
      'Snake gourd',
      'Spinach (malabar)',
      'Spinach (red)',
      'Tomatoes (red)',
    ],
  };

  // ==================== UNITS — 8 exact ====================
  static const List<String> units = [
    'KG',
    'L',
    '1 piece',
    '10 pcs',
    '100 KG',
    '12 KG',
    '500 G',
    '1 Roll',
  ];

  // ==================== PRICE TYPES — 2 exact ====================
  static const List<String> priceTypes = [
    'Retail',
    'Wholesale',
  ];

  // ==================== PRICE FLAGS — 3 exact ====================
  static const List<String> priceFlags = [
    'actual',
    'aggregate',
    'actual,aggregate',
  ];

  // ==================== HELPER METHODS ====================

  static List<String> getDistricts(String? division) {
    if (division == null) return [];
    return districtsByDivision[division] ?? [];
  }

  static List<String> getMarkets(String? district) {
    if (district == null) return [];
    return marketsByDistrict[district] ?? [];
  }

  static List<String> getCommodities(String? category) {
    if (category == null) return [];
    return commoditiesByCategory[category] ?? [];
  }

  static double? getLatitude(String? market) {
    if (market == null) return null;
    return marketCoordinates[market]?['lat'];
  }

  static double? getLongitude(String? market) {
    if (market == null) return null;
    return marketCoordinates[market]?['lon'];
  }

  static String getCommodityEmoji(String commodity) {
    final lower = commodity.toLowerCase();
    if (lower.contains('rice'))                           return '🌾';
    if (lower.contains('wheat'))                          return '🌾';
    if (lower.contains('potato'))                         return '🥔';
    if (lower.contains('egg'))                            return '🥚';
    if (lower.contains('chicken'))                        return '🐔';
    if (lower.contains('beef'))                           return '🥩';
    if (lower.contains('fish') || lower.contains('shrimp')) return '🐟';
    if (lower.contains('milk'))                           return '🥛';
    if (lower.contains('oil'))                            return '🫙';
    if (lower.contains('lentil') || lower.contains('bean') || lower.contains('chickpea')) return '🫘';
    if (lower.contains('onion') || lower.contains('garlic')) return '🧅';
    if (lower.contains('tomato'))                         return '🍅';
    if (lower.contains('banana'))                         return '🍌';
    if (lower.contains('apple'))                          return '🍎';
    if (lower.contains('orange'))                         return '🍊';
    if (lower.contains('lemon'))                          return '🍋';
    if (lower.contains('chili'))                          return '🌶️';
    if (lower.contains('spinach') || lower.contains('cabbage') || lower.contains('gourd')) return '🥬';
    if (lower.contains('carrot'))                         return '🥕';
    if (lower.contains('eggplant'))                       return '🍆';
    if (lower.contains('pumpkin') || lower.contains('papaya')) return '🎃';
    if (lower.contains('sugar'))                          return '🍬';
    if (lower.contains('salt'))                           return '🧂';
    if (lower.contains('fuel') || lower.contains('firewood')) return '⛽';
    if (lower.contains('soap') || lower.contains('detergent') ||
        lower.contains('toothpaste') || lower.contains('toilet') ||
        lower.contains('sanitary')) {
      return '🧴';
    }
    return '🛒';
  }
}