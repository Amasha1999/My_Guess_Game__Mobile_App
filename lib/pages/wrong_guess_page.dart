import 'package:flutter/material.dart';

class WrongGuessPage extends StatelessWidget {
  const WrongGuessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrong Guess'),
      ),
      backgroundColor: const Color.fromARGB(
          255, 242, 180, 175), // Set the background color to light red
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sorry! Wrong guess. Please try again.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Go Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
