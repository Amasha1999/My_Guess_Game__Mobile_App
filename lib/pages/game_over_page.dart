import 'package:flutter/material.dart';
import 'package:flutter_application_guess_game/pages/home_page.dart';

class GameOverPage extends StatelessWidget {
  final int guessedNumber; // Add the required argument

  const GameOverPage({required this.guessedNumber, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Over'),
      ),
      backgroundColor: const Color.fromARGB(255, 175, 214, 242),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Game Over.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10), // Add some space between the texts
            RichText(
              text: TextSpan(
                text: 'Oh! I guessed ',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text: '$guessedNumber', // Display the guessed number
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  const TextSpan(
                    text: '.',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Restart Game'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
