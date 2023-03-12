import 'package:flutter/material.dart';

class TestAnemiaScreen extends StatelessWidget {
  const TestAnemiaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {Navigator.of(context).pushNamed("/login");},
              child: const Text('Ir a Login'),
            ),
            ElevatedButton(
              onPressed: () {Navigator.of(context).pushNamed("/quizzes");},
              child: const Text('Ir a quizzes'),
            ),
            ElevatedButton(
              onPressed: () {Navigator.of(context).pushNamed("/botonesMuestra");},
              child: const Text('Ir a muestra de botones'),
            ),
          ],
        ),
      );
  }
}