import 'package:flutter_riverpod/flutter_riverpod.dart';

final testViewModelProvider = StateNotifierProvider<TestViewModel, bool>((ref) {
  return TestViewModel();
});

class TestViewModel extends StateNotifier<bool> {
  TestViewModel() : super(true);

  void changeValue() {
    state = !state;
  }
}
