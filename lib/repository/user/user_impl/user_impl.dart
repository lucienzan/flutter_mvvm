import 'package:dio/dio.dart';
import 'package:flutter_mvvm/model/user.dart';
import 'package:flutter_mvvm/repository/user/user_repo/user_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../config/logger.dart';

class UserImpl extends UserRepository {
  @override
  Future<List<User>> fetchUsers() async {
    try {
      final userResponse =
          await Dio().get("https://jsonplaceholder.typicode.com/users");
      return [for(final user in userResponse.data) User.fromMap(user)];
    } on Exception catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }
}

final userRepoProvider = Provider<UserImpl>((ref) {
  return UserImpl() ;
});