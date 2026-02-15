import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext context, String message, Color backgroundColor) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar(); // Hide previous snackbar if any

    messenger.showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
