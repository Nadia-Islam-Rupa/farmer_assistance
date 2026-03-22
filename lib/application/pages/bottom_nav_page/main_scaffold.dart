import 'package:farmer_assistance/application/pages/bottom_nav_page/providers/bottom_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../home_page/homepage.dart';
import '../forcast/forecast_page.dart';
import '../chatbot/chatbot_page.dart';
import '../profile/profile_page.dart';

/// Main navigation container that manages all bottom navigation pages
/// Uses IndexedStack to preserve state across tab switches
class MainScaffold extends ConsumerWidget {
  const MainScaffold({super.key});

  /// List of all pages corresponding to bottom nav tabs
  static final List<Widget> _pages = [
    HomePage(), // index 0
    ForecastPage(), // index 1
    ChatbotPage(), // index 2
    ProfilePage(), // index 3
  ];

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
        body: IndexedStack(index: currentIndex, children: _pages),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Color(0xff00796B),
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
