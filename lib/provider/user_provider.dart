import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

final nameProvider = StateProvider.autoDispose<String>((ref) {
  ref.onDispose(() {
    print("dispose name provider");
  });
  return "hello";
});

@Riverpod(keepAlive: true)
String changeNameProvider(Ref ref, String there) {
  ref.onDispose(() {
    print("dispose change name provider");
  });
  final name = ref.watch(nameProvider);
  print(name);
  return there;
}

final countProvider = StateProvider.family.autoDispose<int, int>((ref, int count) {
  return count;
});