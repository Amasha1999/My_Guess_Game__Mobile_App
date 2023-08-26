import 'package:flutter/material.dart';
import 'package:flutter_application_guess_game/pages/right_guess_page.dart';
import 'package:flutter_application_guess_game/pages/wrong_guess_page.dart';
import 'package:flutter_application_guess_game/pages/game_over_page.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  int _secretNumber = 0;
  int _guessesRemaining = 3;
  int _chancesTaken = 0;

  @override
  void initState() {
    super.initState();
    _generateSecretNumber();
  }

  void _generateSecretNumber() {
    final random = Random();
    _secretNumber = random.nextInt(10) + 1;
  }

  void _checkGuess() {
    int? guessedNumber = int.tryParse(_controller.text);
    if (guessedNumber != null) {
      if (guessedNumber == _secretNumber) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CorrectGuessPage(correctNumber: _secretNumber),
          ),
        );
      } else {
        setState(() {
          _guessesRemaining--;
          _chancesTaken++;
        });
        if (_guessesRemaining == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GameOverPage(guessedNumber: _secretNumber),
            ),
          );
        } else {
          _controller.clear();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WrongGuessPage(),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess Game'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/guess_image.jpg',
                          width: 230,
                          height: 230,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Text(
                        'I have a secret number in my mind (1 - 10). You have $_guessesRemaining chances to guess it.',
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        '$_chancesTaken of 3 chances are taken',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: TextFormField(
                          controller: _controller,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            labelText: 'Enter your guess',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '$_guessesRemaining/3',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: _checkGuess,
                        child: const Text('Guess'),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
