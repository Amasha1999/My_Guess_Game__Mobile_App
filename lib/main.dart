import 'package:flutter/material.dart';
import 'package:flutter_application_guess_game/pages/home_page.dart';

void main() {
  runApp(const GuessingGameApp());
}

class GuessingGameApp extends StatelessWidget {
  const GuessingGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guessing Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
