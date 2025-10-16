import 'package:flutter_riverpod/legacy.dart';

class PageNotifier extends StateNotifier<int> {
  PageNotifier() : super(0);

  void setPage(int index) => state = index;
}

final pageProvider = StateNotifierProvider<PageNotifier, int>((ref) {
  return PageNotifier();
});
