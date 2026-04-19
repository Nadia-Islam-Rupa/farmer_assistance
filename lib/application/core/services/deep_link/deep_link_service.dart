import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../routing/app_router.dart';

/// Handles incoming deep links for the password-recovery flow.
///
/// Works for both:
///   • Cold start  – app was closed when the user tapped the email link.
///   • Hot start   – app was in the background / foreground.
///
/// Flow:
///   1. Parse the deep-link URI fragment for `access_token` and `type=recovery`.
///   2. Call `auth.setSession()` to establish an authenticated Supabase session.
///   3. Set [hasPendingRecovery] so the GoRouter redirect sends the user to the
///      reset-password page regardless of when the router was initialised.
class DeepLinkService {
  // ---------------------------------------------------------------------------
  // Static flag – readable by AppRouter.redirect before the router exists.
  // ---------------------------------------------------------------------------

  static bool _pendingRecovery = false;

  /// True when a valid recovery deep link has been processed and GoRouter has
  /// not yet navigated to the reset-password page.
  static bool get hasPendingRecovery => _pendingRecovery;

  /// Called by AppRouter.redirect once the user has been sent to the
  /// reset-password page, so future redirects are not affected.
  static void consumePendingRecovery() => _pendingRecovery = false;

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
    final params = Uri.splitQueryString(uri.fragment);
    if (params['type'] != 'recovery') return;

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

    // Hot start: GoRouter is already running, so force an immediate redirect
    // re-evaluation.  For cold start this is a no-op (no listeners yet) but
    // the static flag above will be read by the redirect on its first run.
    AppRouter.refreshListenable.triggerRefresh();
  }

  void dispose() => _sub?.cancel();
}
