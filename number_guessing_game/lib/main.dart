// code by J_P_Sathavara
// contact me \\thekeen003@gmail.com

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Guessing Game',
      debugShowCheckedModeBanner: false,
      home: const GameScreen(),
    );

  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);


  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final Random _random = Random();
  late int _secretNumber; // Declare _secretNumber as late
  int _guessCount = 0;
  String _message = 'Guess a number between 1 and 100!';

  @override
  void initState() {
    super.initState();
    _generateSecretNumber(); // Generate the secret number in initState
  }

  void _generateSecretNumber() {
    setState(() {
      _secretNumber = _random.nextInt(100) + 1;
    });
  }

  void _handleGuess(int guess) {
    setState(() {
      _guessCount++;
      if (guess == _secretNumber) {
        _message = 'Congratulations! You guessed the number in $_guessCount attempts.';
        _secretNumber = _random.nextInt(100) + 1; // Reset for a new game
        _guessCount = 0;
      } else if (guess < _secretNumber) {
        _message = 'Too low! Try again.';
      } else {
        _message = 'Too high! Try again.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Guessing Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_message),
            TextField(
              keyboardType: TextInputType.number,
              onSubmitted: (value) => _handleGuess(int.parse(value)),
            ),
          ],
        ),
      ),
    );
  }
}
