import 'package:flutter/material.dart';

import 'home_screen/home_screen.dart';

void main() {
  runApp(const HomeScreen());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}
