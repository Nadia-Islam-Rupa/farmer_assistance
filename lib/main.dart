import 'package:farmer_assistance/application/core/services/deep_link/deep_link_service.dart';
import 'package:farmer_assistance/application/core/services/routing/app_router.dart';
import 'package:farmer_assistance/application/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'di/di.dart';

// Kept alive for the full app lifetime so the uni_links subscription stays active.
final _deepLinkService = DeepLinkService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://rdqpssnvyywzjiqrokfv.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJkcXBzc252eXl3emppcXJva2Z2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzA0Mzg3NDIsImV4cCI6MjA4NjAxNDc0Mn0.3qjJlUXak0Jevxhp4OUdjXHYV1jJhjd687YHo8OlJQU",
  );

  await configureDependencies();

  // Force-initialise GoRouterRefreshSupabase so it subscribes to Supabase auth
  // events BEFORE _deepLinkService calls setSession().  Without this touch,
  // a cold-start recovery link fires its event before the listener exists
  // and _lastEvent would never become passwordRecovery.
  // ignore: unnecessary_statements
  AppRouter.refreshListenable;

  await _deepLinkService.init();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Farmer Assistance',
      theme: AppTheme.lightTheme,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routerDelegate: AppRouter.router.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}
