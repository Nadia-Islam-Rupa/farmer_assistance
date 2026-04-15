import 'package:farmer_assistance/application/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

/// Utility class for showing snackbars in crop recommendation feature
class CropSnackbarUtils {
  CropSnackbarUtils._();

  static const _primaryColor = AppTheme.primaryTeal;
  static const _errorColor = AppTheme.errorRed;

  /// Show success message when weather data is updated
  static void showWeatherUpdateSuccess(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Weather data updated successfully!'),
        backgroundColor: _primaryColor,
      ),
    );
  }

  /// Show error message when weather data fetch fails
  static void showWeatherUpdateError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Unable to fetch weather data. Please try again.'),
        backgroundColor: _errorColor,
      ),
    );
  }

  /// Show success message when crop recommendation is generated
  static void showRecommendationSuccess(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Crop recommendation generated successfully!'),
        backgroundColor: _primaryColor,
        duration: Duration(seconds: 2),
      ),
    );
  }

  /// Show error message when recommendation generation fails
  static void showRecommendationError(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $error'), backgroundColor: _errorColor),
    );
  }
}
