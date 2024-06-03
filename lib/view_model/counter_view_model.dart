import 'package:flutter_riverpod/flutter_riverpod.dart';

//fianl
final counterViewModelProvider =
    StateNotifierProvider<CounterViewModel, int>((ref) {
  return CounterViewModel();
});

class CounterViewModel extends StateNotifier<int> {
  CounterViewModel() : super(0);

  // increament
  void increament() {
    state = state + 1;
  }

  // decreament
  void decreament() {
    if (state > 0) {
      state = state - 1;
    }
  }
}
