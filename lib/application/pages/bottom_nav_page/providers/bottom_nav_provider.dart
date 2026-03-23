import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Manages the currently selected bottom navigation bar tab index
class BottomNavNotifier extends Notifier<int> {
  @override
  int build() => 0; // Initial state: Home tab (index 0)

  /// Updates the selected tab index
  void setIndex(int index) {
    state = index;
  }
}

/// Provider for bottom navigation state management
/// Watches the currently selected tab index (0-3)
final bottomNavProvider = NotifierProvider<BottomNavNotifier, int>(() {
  return BottomNavNotifier();
});
