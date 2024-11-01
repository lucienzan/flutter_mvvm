import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mvvm/model/user.dart';
import 'package:flutter_mvvm/utils/constants/messages.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../repository/user/user_impl/user_impl.dart';

class UserList extends HookConsumerWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final errorMsg = useState("");
    final users = useState<List<User>>([]);
    final repo = ref.watch(userRepoProvider);

    useEffect(() {
      Future<void> userList() async {
        try {
          isLoading.value = true;
          users.value = await repo.fetchUsers();
        } on Exception catch (e) {
          errorMsg.value = e.toString();
        } finally {
          isLoading.value = false;
        }
      }
      userList();
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(title: Text(Messages.userList)),
      body: isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : errorMsg.value.isEmpty
              ? _listUsers(context, users.value)
              : _buildError(context, errorMsg.value),
    );
  }
}

Widget _listUsers(BuildContext context, List<User> users) {
  return ListView.separated(
    itemBuilder: (BuildContext contex, index) {
      final user = users[index];
      return ListTile(
        title: Text(user.username),
      );
    },
    itemCount: users.length,
    separatorBuilder: (BuildContext context, int index) {
      return const Divider();
    },
  );
}

Widget _buildError(BuildContext context, String errorMessage) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage,
          ),
          const Gap(10),
          OutlinedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text(Messages.back))
        ],
      ),
    ),
  );
}
