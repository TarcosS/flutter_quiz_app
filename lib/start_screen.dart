import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/fadein_animation.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FadeInAnimation(
      body: StartScreenBody(startQuiz: startQuiz),
      duration: 2,
    ));
  }
}

class StartScreenBody extends StatelessWidget {
  const StartScreenBody({
    super.key,
    required this.startQuiz,
  });

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/quiz-logo.png',
          width: 300,
        ),
        const SizedBox(
          height: 80,
        ),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 237, 223, 252),
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          icon: const Icon(
            Icons.arrow_right_alt,
          ),
          label: const Text('Start Quiz'),
        )
      ],
    );
  }
}
