import 'dart:async';
import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

String mapSupabaseAuthError(Object error) {
  // ==============================
  // Auth API errors (Sign in / Sign up / OAuth / Reset password)
  // ==============================
  if (error is AuthApiException) {
    switch (error.code) {

    // ---------- SIGN UP ----------
      case 'user_already_exists':
        return 'An account with this email address already exists.';

      case 'weak_password':
        return 'The password is too weak. Please choose a stronger password.';

      case 'invalid_email':
        return 'Please enter a valid email address.';

      case 'over_email_send_rate_limit':
        return 'Too many requests have been made. Please wait a few minutes and try again.';

    // ---------- SIGN IN ----------
      case 'invalid_login_credentials':
        return 'The email or password you entered is incorrect.';

      case 'email_not_confirmed':
        return 'Please verify your email address before signing in.';

    // ---------- FORGOT PASSWORD ----------
      case 'same_password':
        return 'Your new password must be different from the old password.';

      case 'otp_expired':
        return 'The verification code has expired. Please request a new one.';

      case 'invalid_otp':
        return 'The verification code you entered is invalid.';

    // ---------- GOOGLE / OAUTH ----------
      case 'oauth_failed':
        return 'Google sign-in failed. Please try again.';

      case 'provider_disabled':
        return 'This sign-in method is currently unavailable.';

    // ---------- GENERAL ----------
      default:
        return error.message.isNotEmpty
            ? error.message
            : 'We were unable to complete your request. Please try again later.';
    }
  }

  // ==============================
  // Session-related errors
  // ==============================
  if (error is AuthException) {
    return 'Your session has expired. Please sign in again.';
  }

  // ==============================
  // Database / RLS / Insert errors
  // ==============================
  if (error is PostgrestException) {
    return 'We were unable to save your information. Please try again.';
  }

  // ==============================
  // Network errors
  // ==============================
  if (error is SocketException) {
    return 'No internet connection. Please check your network and try again.';
  }

  // ==============================
  // Timeout
  // ==============================
  if (error is TimeoutException) {
    return 'The request took too long. Please try again.';
  }

  // ==============================
  // Fallback
  // ==============================
  return 'Something went wrong. Please try again later.';
}
