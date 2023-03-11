import 'package:flutter/material.dart';
import 'package:iron_kids/screens/quizzes_screen.dart';

import '../styles/app_theme.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.primary100,
        appBar: AppBar(
          title: const Text('Login'),
        ),
        //padding: const EdgeInsets.all(16.0),
        body: QuestionCard());
  }
}
