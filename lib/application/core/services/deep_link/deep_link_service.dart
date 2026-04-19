import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../routing/app_router.dart';

/// Handles incoming deep links for both the password-recovery and
/// email-confirmation (signup verification) flows.
///
/// Works for both:
///   • Cold start  – app was closed when the user tapped the email link.
///   • Hot start   – app was in the background / foreground.
class DeepLinkService {
  // ---------------------------------------------------------------------------
  // Static flags – readable by AppRouter.redirect before the router exists.
  // ---------------------------------------------------------------------------

  static bool _pendingRecovery = false;
  static bool _pendingEmailVerification = false;

  /// True when a valid recovery deep link has been processed and GoRouter has
  /// not yet navigated to the reset-password page.
  static bool get hasPendingRecovery => _pendingRecovery;

  /// True when a signup-confirmation deep link has been processed and GoRouter
  /// has not yet navigated to the login page.
  static bool get hasPendingEmailVerification => _pendingEmailVerification;

  /// Called by AppRouter.redirect once the user has been sent to the
  /// reset-password page, so future redirects are not affected.
  static void consumePendingRecovery() => _pendingRecovery = false;

  /// Called by AppRouter.redirect once the user has been sent to the
  /// login page after email verification.
  static void consumePendingEmailVerification() =>
      _pendingEmailVerification = false;

  // ---------------------------------------------------------------------------
  // Instance – owns the app_links subscription.
  // ---------------------------------------------------------------------------

  final _appLinks = AppLinks();
  StreamSubscription<Uri>? _sub;

  /// Call once from `main()` after Supabase is initialised.
  Future<void> init() async {
    // ── Cold start: app launched from a closed state via deep link ────────────
    final initialUri = await _appLinks.getInitialLink();
    if (initialUri != null) await _handleUri(initialUri);

    // ── Hot start: app in background / foreground receives a deep link ────────
    _sub = _appLinks.uriLinkStream.listen(
      (uri) async => _handleUri(uri),
      onError: (_) {},
    );
  }

  Future<void> _handleUri(Uri uri) async {
    if (uri.fragment.isEmpty) return;

    // Supabase appends session data as a URL fragment, e.g.:
    //   myapp://reset-password#access_token=…&refresh_token=…&type=recovery
    //   myapp://reset-password#access_token=…&refresh_token=…&type=signup
    final params = Uri.splitQueryString(uri.fragment);
    final type = params['type'];

    if (type == 'recovery') {
      await _handleRecovery(params);
    } else if (type == 'signup') {
      await _handleEmailVerification(params);
    }
  }

  // ── Password recovery ──────────────────────────────────────────────────────

  Future<void> _handleRecovery(Map<String, String> params) async {
    final accessToken = params['access_token'];
    if (accessToken == null) return;

    try {
      // Establish the Supabase session using the recovery access token.
      await Supabase.instance.client.auth.setSession(accessToken);
    } catch (_) {
      // Expired or invalid token – the session guard on the page will
      // redirect the user back to forgot-password.
      return;
    }

    _pendingRecovery = true;
    AppRouter.refreshListenable.triggerRefresh();
  }

  // ── Email / signup confirmation ────────────────────────────────────────────

  Future<void> _handleEmailVerification(Map<String, String> params) async {
    final refreshToken = params['refresh_token'];
    if (refreshToken == null) return;

    try {
      // Confirm the email by exchanging the refresh token Supabase issued.
      await Supabase.instance.client.auth.setSession(refreshToken);
      // Immediately sign out so the user lands on the login page unauthenticated.
      await Supabase.instance.client.auth.signOut();
    } catch (_) {
      // Expired / already-used token – silently ignore.
      return;
    }

    _pendingEmailVerification = true;

    // Hot start: force an immediate router re-evaluation.
    // Cold start: the static flag is read by the redirect on its first run.
    AppRouter.refreshListenable.triggerRefresh();

    // Show success snackbar after GoRouter has finished navigating to the
    // login page (two post-frame callbacks give the router enough time).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final ctx = AppRouter.rootNavigatorKey.currentContext;
        if (ctx != null) {
          ScaffoldMessenger.of(ctx).showSnackBar(
            const SnackBar(
              content: Text('Email verified successfully. Please login.'),
              backgroundColor: Color(0xFF008080),
              duration: Duration(seconds: 4),
            ),
          );
        }
      });
    });
  }

  void dispose() => _sub?.cancel();
}
