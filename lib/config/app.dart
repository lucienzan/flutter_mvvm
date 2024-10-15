import 'package:flutter/material.dart';

import '../screens/home/home.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}
