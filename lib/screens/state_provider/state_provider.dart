import 'package:flutter/material.dart';
import 'package:flutter_mvvm/provider/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StateProviderPage extends ConsumerStatefulWidget {
  const StateProviderPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StateProviderPageState();
}

class _StateProviderPageState extends ConsumerState<StateProviderPage> {
  @override
  Widget build(BuildContext context) {
    final count = ref.watch(countProvider(10));
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Text(count.toString()),
              ElevatedButton(
              onPressed: () {
                ref.read(changeNameProviderProvider("Test"));
              },
              child: const Text("Test")),
              ElevatedButton(
              onPressed: () {
                ref.read(countProvider(10).notifier).update((state) => state + 10);
              },
              child: const Text("Count+"))
            ],

          )),
    );
  }
}
