import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.onResetQuiz, required this.choosenAnswers});

  final void Function() onResetQuiz;
  final List<String> choosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'answer': choosenAnswers[i],
        'correct_answer': questions[i].answers[0],
        'isCorrect': questions[i].answers[0] == choosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final List<Map<String, Object>> summaryData = getSummaryData();
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered ${summaryData.where((element) => element["isCorrect"] == true).length} out of ${summaryData.length} questions correctly!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red.shade100),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              icon: const Icon(Icons.restart_alt_sharp),
              onPressed: onResetQuiz,
              label: const Text('Restart Quiz!'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
