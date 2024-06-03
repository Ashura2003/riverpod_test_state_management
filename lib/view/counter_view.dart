import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/view_model/counter_view_model.dart';

// *******************************************************************State Notifier Provider*******************************************************************//



// Creating provider

final appBarTitleProvider = Provider<String>((ref) => "Counter App");

class CounterView extends ConsumerWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(counterViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ref.read(appBarTitleProvider),
        ),
      ),
      body: Center(
        child: Text(
          value.toString(),
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
              ref.read(counterViewModelProvider.notifier).increament();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 8,
          ),
          FloatingActionButton(
            onPressed: () {
              ref.read(counterViewModelProvider.notifier).decreament();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
