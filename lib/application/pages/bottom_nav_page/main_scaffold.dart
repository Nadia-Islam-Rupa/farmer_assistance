// ignore_for_file: deprecated_member_use

import 'package:farmer_assistance/application/core/theme/app_theme.dart';
import 'package:farmer_assistance/application/pages/bottom_nav_page/providers/bottom_nav_provider.dart';
import 'package:farmer_assistance/application/pages/forcast/weekly_fore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../chatbot/chatbot_page.dart';
import '../home_page/homepage.dart';
import '../profile/profile_page.dart';

/// Main navigation container that manages all bottom navigation pages
/// Uses IndexedStack to preserve state across tab switches
class MainScaffold extends ConsumerWidget {
  const MainScaffold({super.key});

  /// List of all pages corresponding to bottom nav tabs

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const WeeklyForecastPage();
      case 2:
        return const ChatbotPage();
      case 3:
        return const ProfilePage();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);

    return PopScope(
      canPop: currentIndex == 0,
      onPopInvoked: (didPop) {
        // On back button, navigate to Home tab if not already there
        if (!didPop && currentIndex != 0) {
          ref.read(bottomNavProvider.notifier).setIndex(0);
        }
      },
      child: Scaffold(
        body: _buildPage(currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: AppTheme.primaryTeal,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          elevation: 8,
          onTap: (index) {
            ref.read(bottomNavProvider.notifier).setIndex(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Forecast',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: 'Chatbot',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
