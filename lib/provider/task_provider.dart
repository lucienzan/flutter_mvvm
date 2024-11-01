import 'package:hooks_riverpod/hooks_riverpod.dart';

final taskProvider = Provider<String>((ref) {
  return "Hello this is first provider" ;
});