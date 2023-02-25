import 'package:flutter/material.dart';
import 'package:wonders_of_world/ui/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Wonders Of World',
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
