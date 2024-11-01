import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommButton extends HookConsumerWidget {
  final String title;
  final Widget child;
  const CommButton(this.title, this.child, {super.key});
  @override

  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FilledButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => child));
        },
        child: Text(title),
      ),
    );
  }
}
