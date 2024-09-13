import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),

          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 200,
          //   ),
          // ),
          const SizedBox(height: 50),
          const Text(
            'Learn Android the Fun Way',
            style: TextStyle(
                color: Color.fromARGB(255, 243, 240, 240), fontSize: 18),
          ),
          const SizedBox(height: 25),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 243, 240, 240),
            ),
            icon: const Icon(Icons.arrow_right_alt_rounded),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
