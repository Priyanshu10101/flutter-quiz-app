import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];
  void restartQuiz(){
    setState(() {
      selectedAnswers=[];
      activeScreen=StartScreen(switchScreen);
    });
  }
  void chooseAnswers(String answers) {
    selectedAnswers.add(answers);

    setState(
      () {
        if (selectedAnswers.length == questions.length) {
          activeScreen = ResultsScreen(
            chosenAnswer: selectedAnswers,
            onTap: restartQuiz,
          );
        }
      },
    );
  }

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(
      () {
        activeScreen = QuestionsScreen(
          onSelectAnswer: chooseAnswers,
        );
      },
    );
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 117, 109, 115),
                  Color.fromARGB(255, 107, 15, 168)
                ],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
            ),
            child: activeScreen),
      ),
    );
  }
}
