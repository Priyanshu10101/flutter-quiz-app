import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summary, {super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: data['color'] as Color,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Your answer: ${data['user_answer']}',
                        style: const TextStyle(
                            color: Color.fromARGB(133, 21, 214, 14)),
                      ),
                      Text('corect answer:${data['correct_answer'] as String}',
                        style: const TextStyle(
                            color: Color.fromARGB(133, 255, 125, 4)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            );
          }).toList(), // Convert the result of .map() to a list
        ),
      ),
    );
  }
}
