import 'package:flutter/material.dart';
import 'package:flutter_application_guess_game/pages/home_page.dart';

class CorrectGuessPage extends StatelessWidget {
  final int correctNumber; // Add the required argument

  const CorrectGuessPage({required this.correctNumber, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Correct Guess'),
      ),
      backgroundColor: const Color.fromARGB(255, 175, 242, 178),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Congratulations! You\'ve guessed it correctly.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10), // Add some space between the texts
            RichText(
              text: TextSpan(
                text: 'The correct number is ',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        '$correctNumber', // Display the correct guessed number
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
