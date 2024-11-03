import 'package:flutter/material.dart';
import 'package:flutter_mvvm/screens/state_provider/state_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return SafeArea(
      child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const StateProviderPage()));
          },
          child: const Text("Test")),
    );
  }
}
