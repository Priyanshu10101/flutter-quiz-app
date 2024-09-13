import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswer, required this.onTap});

  final void Function() onTap;
  final List<String> chosenAnswer;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].questionText,
          'correct_answer': questions[i].answersText[0],
          'user_answer': chosenAnswer[i],
        },
      );
      if (summary[i]['correct_answer'] == summary[i]['user_answer']) {
        summary[i]['color'] = Colors.green.shade200;
      } else {
        summary[i]['color'] = const Color.fromARGB(255, 204, 79, 79);
      }
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where(
      (data) {
        return data['user_answer'] == data['correct_answer'];
      },
    ).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly'),
            const SizedBox(height: 10),
            QuestionsSummary(summaryData),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: onTap,
              child: const Text(
                'Restart Quiz',
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
