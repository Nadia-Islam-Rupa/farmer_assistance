import 'package:flutter/material.dart';

/// Centralized theme for the Farmer Assistance app
/// Maintains consistency across all pages with teal/green agricultural theme
class AppTheme {
  // ==================== PRIMARY COLORS ====================

  /// Main teal color - used for AppBars, primary buttons, accents
  static const Color primaryTeal = Color(0xff00796B);

  /// Light teal - used for gradients, hover states
  static const Color lightTeal = Color(0xff26A69A);

  /// Deep teal - used for dark text on light backgrounds
  static const Color deepTeal = Color(0xff004D40);

  /// Success green - used for success messages, positive feedback
  static const Color successGreen = Color(0xff4CAF50);

  /// Light green accent
  static const Color lightGreenAccent = Color(0xff81C784);

  // ==================== SECONDARY COLORS ====================

  /// Warning/alert color
  static const Color warningOrange = Color(0xffFF9800);

  /// Error/danger color
  static const Color errorRed = Color(0xffF44336);

  /// Info blue
  static const Color infoBlue = Color(0xff2196F3);

  // ==================== BACKGROUND COLORS ====================

  /// Main app background
  static const Color backgroundColor = Color(0xffF1FAF8);

  /// Page top gradient tint
  static const Color pageTopTint = Color(0xffD7F2EE);

  /// Page bottom gradient tint
  static const Color pageBottomTint = Color(0xffF3FBF9);

  /// Card background
  static const Color cardBackground = Colors.white;

  /// Light grey background for sections
  static const Color lightGrey = Color(0xffF5F5F5);

  // ==================== TEXT COLORS ====================

  /// Primary text color (dark)
  static const Color textPrimary = Color(0xff212121);

  /// Secondary text color (grey)
  static const Color textSecondary = Color(0xff757575);

  /// Hint text color (light grey)
  static const Color textHint = Color(0xff9E9E9E);

  /// White text for dark backgrounds
  static const Color textWhite = Colors.white;

  /// Text on teal background
  static const Color textOnTeal = Colors.white;

  // ==================== GRADIENTS ====================

  /// Primary gradient (teal)
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryTeal, lightTeal],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Page background gradient
  static LinearGradient pageBackgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [primaryTeal.withValues(alpha: 0.1), Colors.white],
    stops: const [0, 0.3],
  );

  /// Light gradient for cards/sections
  static LinearGradient lightGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryTeal.withValues(alpha: 0.08), Colors.white],
  );

  // ==================== SHADOWS ====================

  /// Card shadow
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.grey.shade200,
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];

  /// Elevated card shadow
  static List<BoxShadow> elevatedShadow = [
    BoxShadow(
      color: primaryTeal.withValues(alpha: 0.3),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];

  /// Subtle shadow
  static List<BoxShadow> subtleShadow = [
    BoxShadow(
      color: Colors.grey.shade300,
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];

  // ==================== BORDER RADIUS ====================

  /// Small radius (8px)
  static const double radiusSmall = 8.0;

  /// Medium radius (12px)
  static const double radiusMedium = 12.0;

  /// Large radius (16px)
  static const double radiusLarge = 16.0;

  /// Extra large radius (24px)
  static const double radiusXLarge = 24.0;

  // ==================== SPACING ====================

  /// Extra small spacing (4px)
  static const double spacingXS = 4.0;

  /// Small spacing (8px)
  static const double spacingS = 8.0;

  /// Medium spacing (12px)
  static const double spacingM = 12.0;

  /// Large spacing (16px)
  static const double spacingL = 16.0;

  /// Extra large spacing (20px)
  static const double spacingXL = 20.0;

  /// Extra extra large spacing (24px)
  static const double spacingXXL = 24.0;

  // ==================== THEME DATA ====================

  /// Get Material Theme configuration
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryTeal,
        primary: primaryTeal,
        secondary: lightTeal,
        error: errorRed,
        surface: cardBackground,
        onPrimary: textWhite,
        onSecondary: textWhite,
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryTeal,
        foregroundColor: textWhite,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: textWhite,
        ),
      ),
      cardTheme: CardThemeData(
        color: cardBackground,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusLarge),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryTeal,
          foregroundColor: textWhite,
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: spacingXL,
            vertical: spacingM,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMedium),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryTeal,
          side: const BorderSide(color: primaryTeal),
          padding: const EdgeInsets.symmetric(
            horizontal: spacingXL,
            vertical: spacingM,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMedium),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMedium),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMedium),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMedium),
          borderSide: const BorderSide(color: primaryTeal, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMedium),
          borderSide: const BorderSide(color: errorRed, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMedium),
          borderSide: const BorderSide(color: errorRed, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: spacingL,
          vertical: spacingM,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryTeal,
        foregroundColor: textWhite,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: primaryTeal,
        contentTextStyle: const TextStyle(color: textWhite),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusSmall),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // ==================== HELPER METHODS ====================

  /// Get gradient container decoration
  static BoxDecoration gradientContainer({
    Gradient? gradient,
    double? radius,
    List<BoxShadow>? boxShadow,
  }) {
    return BoxDecoration(
      gradient: gradient ?? primaryGradient,
      borderRadius: BorderRadius.circular(radius ?? radiusLarge),
      boxShadow: boxShadow ?? elevatedShadow,
    );
  }

  /// Get card decoration
  static BoxDecoration cardDecoration({
    Color? color,
    double? radius,
    List<BoxShadow>? boxShadow,
  }) {
    return BoxDecoration(
      color: color ?? cardBackground,
      borderRadius: BorderRadius.circular(radius ?? radiusLarge),
      boxShadow: boxShadow ?? cardShadow,
    );
  }

  /// Get page background decoration
  static BoxDecoration pageDecoration() {
    return BoxDecoration(gradient: pageBackgroundGradient);
  }
}
