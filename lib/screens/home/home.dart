import 'package:flutter/material.dart';
import 'package:flutter_mvvm/model/user.dart';
import 'package:flutter_mvvm/provider/task_provider.dart';
import 'package:flutter_mvvm/screens/user/user_list/user_list.dart';
import 'package:flutter_mvvm/utils/widgets/comm_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends HookConsumerWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(taskProvider);
    const user1 = User(
        id: 1,
        name: 'Thein',
        username: 'zan',
        email: 'zan@gmail.com',
        address: Address(
            street: 'street',
            city: 'Yangon',
            zipcode: '18011',
            geo: Geo(lat: 'lat', lng: 'lng'),
            suite: 'kk'),
        phone: '097912345678',
        website: 'zan.com',
        company: Company(name: 'Moon', catchPhrase: 'catchPhrase', bs: 'bs'));
        
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(shrinkWrap: true, children: const [
        CommButton("hello", UserList()),
      ]),
    );
  }
}
