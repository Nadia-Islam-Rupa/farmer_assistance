# Crop Recommendation Feature

## Overview

A well-organized crop recommendation feature that provides personalized crop suggestions based on soil nutrients and weather conditions. The UI is designed to match the app's teal theme and automatically integrates weather data from the weather service.

## Folder Structure

```
crop_recommendation/
├── constants/
│   └── crop_constants.dart          # Crop lists, soil types, validation ranges, emojis
├── models/
│   └── crop_recommendation_result.dart  # Data model for API response
├── providers/
│   └── crop_recommendation_provider.dart  # Riverpod state management
├── widgets/
│   ├── crop_form_card.dart          # Main form with soil and weather inputs
│   ├── crop_header_card.dart        # Header with gradient and weather info
│   ├── crop_input_field.dart        # Reusable input and dropdown components
│   └── crop_result_card.dart        # Beautiful result display card
└── crop_recommendation_page.dart    # Main page with auto-fill logic
```

## Features

### ✅ Completed Features

1. **Auto Weather Integration**: Automatically fills temperature and humidity from weather service
2. **Organized Code**: Clean separation of concerns with dedicated folders
3. **Reusable Components**: All UI components are modular and reusable
4. **Riverpod State Management**: All state is managed through providers
5. **Form Validation**: Comprehensive validation with proper ranges
6. **Theme Consistency**: Matches app's teal theme (#00796B, #26A69A)
7. **Loading States**: Proper loading indicators during processing
8. **Error Handling**: User-friendly error messages

### 🔄 Weather Auto-fill

- Temperature and humidity are automatically populated from the weather service
- Shows weather source (location) in the header
- "Refresh Weather Data" button to manually update values
- Non-intrusive: only fills empty fields on initial load

### 📊 Input Fields

- **Soil Information**: Nitrogen, Phosphorus, Potassium, pH, Soil Type
- **Weather Conditions**: Temperature, Humidity, Rainfall
- All fields have proper validation ranges based on agricultural standards

## Backend Integration Guide

### 🔌 Connecting to Real Backend

The UI is prepared for backend integration. Here's how to connect:

#### 1. Update the API Call in `crop_recommendation_page.dart`

Find the `_getRecommendation()` method around line 118 and replace the dummy logic:

```dart
// REPLACE THIS SECTION (line ~118-170):
// TODO: Replace this with actual API call to backend
await Future.delayed(const Duration(seconds: 1));

String recommendedCrop = _getDummyRecommendation(...);

// WITH YOUR API CALL:
final response = await dio.post(
  'YOUR_BACKEND_URL/api/crop-recommendation',
  data: {
    'nitrogen': nitrogen,
    'phosphorus': phosphorus,
    'potassium': potassium,
    'ph': ph,
    'temperature': temperature,
    'humidity': humidity,
    'rainfall': rainfall,
    'soil_type': selectedSoilType,
  },
);

final result = CropRecommendationResult.fromJson(response.data);
```

#### 2. Expected Backend Response Format

```json
{
  "crop_name": "Rice",
  "confidence": 0.85,
  "tips": [
    "Maintain standing water of 2-3 inches during growing season",
    "Apply nitrogen fertilizer in split doses",
    "Watch for brown plant hopper and stem borer pests"
  ],
  "input_data": {
    "nitrogen": 90,
    "phosphorus": 42,
    "potassium": 43,
    "ph": 6.5,
    "temperature": 28.5,
    "humidity": 80,
    "rainfall": 202,
    "soil_type": "Loamy"
  }
}
```

#### 3. Add Dio Dependency (if not already added)

In your `pubspec.yaml`:

```yaml
dependencies:
  dio: ^5.4.0
```

#### 4. Create a Service Layer (Recommended)

For better organization, create a service file:

```dart
// lib/application/pages/crop_recommendation/services/crop_recommendation_service.dart

class CropRecommendationService {
  final Dio _dio = Dio();

  Future<CropRecommendationResult> getCropRecommendation({
    required double nitrogen,
    required double phosphorus,
    required double potassium,
    required double ph,
    required double temperature,
    required double humidity,
    required double rainfall,
    required String soilType,
  }) async {
    try {
      final response = await _dio.post(
        'YOUR_API_URL/crop-recommendation',
        data: {
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

      return CropRecommendationResult.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to get crop recommendation: $e');
    }
  }
}
```

## UI Components

### CropHeaderCard

- Gradient background matching app theme
- Weather source indicator
- Icon and descriptive text

### CropFormCard

- Two sections: Soil Information & Weather Conditions
- All inputs with proper icons and validation
- Clean white background with subtle shadows

### CropInputField & CropDropdownField

- Reusable form components
- Teal accent color for focus states
- Proper error handling

### CropResultCard

- Beautiful gradient card showing recommended crop
- Crop emoji for visual appeal
- Confidence percentage indicator
- Growing tips in bullet format

## Validation Ranges

Based on agricultural standards:

- **Nitrogen**: 0-140 kg/ha
- **Phosphorus**: 5-145 kg/ha
- **Potassium**: 5-205 kg/ha
- **pH**: 3.5-10
- **Humidity**: 0-100%
- **Rainfall**: 20-300 mm

## Color Scheme

- **Primary Teal**: #00796B
- **Light Teal**: #26A69A
- **Background**: #F1FAF8
- **Cards**: White with subtle shadows
- **Success**: Light green accent

## Future Enhancements

- [ ] Historical recommendation tracking
- [ ] Seasonal crop suggestions
- [ ] Crop price comparison
- [ ] Save favorite crops
- [ ] Export recommendations as PDF
- [ ] Multi-crop comparison

## Notes

- All dummy logic is clearly marked with `// TODO:` comments
- The model class has `fromJson` and `toJson` methods ready for API integration
- State management is properly isolated in providers
- All text controllers are auto-disposed through Riverpod
- Form validation prevents invalid data submission
