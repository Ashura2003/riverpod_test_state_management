import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for app bar title(immutable)
final appBarTitleProvider = Provider<String>((ref) {
  return 'Counter App';
});

// Provider for counter(mutable)
final counterProvider = StateProvider<int>((ref) {
  return 0;
});

class CounterViewState extends ConsumerWidget {
  const CounterViewState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ref.read( // reads the value of the provider and does not change the value once read
            appBarTitleProvider,
          ),
        ),
      ),
      body: Center(
        child: Text(
          ref.watch(counterProvider).toString(), // reads the value of the provider and rebuilds the widget when the value changes
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              ref.read(counterProvider.notifier).state++; // reads the value of the provider and changes the value
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 8,
          ),
          FloatingActionButton(
            onPressed: () {
              if (ref.read(counterProvider) > 0) { // check if the current state is greater than 0
                ref.read(counterProvider.notifier).state--; // reads the value of the provider and changes the value
              }
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
