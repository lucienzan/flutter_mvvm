import 'package:flutter/material.dart';
import 'package:flutter_mvvm/model/user.dart';
import 'package:flutter_mvvm/provider/task_provider.dart';
import 'package:flutter_mvvm/screens/hotel/hotel_list.dart';
import 'package:flutter_mvvm/screens/user/user_list/user_list.dart';
import 'package:flutter_mvvm/utils/widgets/comm_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(shrinkWrap: true, children: const [
        CommButton("users", UserList()),
                CommButton("hotels", HotelList()),
      ]),
    );
  }
}
