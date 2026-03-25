class ValidationUtils {
  /// Validates that a text field is not empty
  static String? requiredText(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Validates that a text field contains a valid number
  static String? requiredNumber(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    if (double.tryParse(value.trim()) == null) {
      return 'Enter a valid number for $fieldName';
    }
    return null;
  }

  /// Validates email format
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  /// Validates that a number is within a specific range
  static String? numberInRange(
    String? value,
    String fieldName, {
    double? min,
    double? max,
  }) {
    final numberError = requiredNumber(value, fieldName);
    if (numberError != null) return numberError;

    final numValue = double.parse(value!.trim());
    if (min != null && numValue < min) {
      return '$fieldName must be at least $min';
    }
    if (max != null && numValue > max) {
      return '$fieldName must be at most $max';
    }
    return null;
  }

  /// Validates minimum length
  static String? minLength(String? value, String fieldName, int minLength) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    if (value.trim().length < minLength) {
      return '$fieldName must be at least $minLength characters';
    }
    return null;
  }
}
