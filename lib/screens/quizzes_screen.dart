import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iron_kids/main.dart';
import 'package:iron_kids/models/quizzes.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets.dart';
import 'package:iron_kids/styles/widgets/header.dart';

class QuizzesScreen extends StatefulWidget {
  const QuizzesScreen({super.key});

  @override
  State<QuizzesScreen> createState() => _QuizzesScreenState();
}

class _QuizzesScreenState extends State<QuizzesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: screenH * 1 / 12,
        title: const Header(
          title: 'Niños de Hierro',
        ),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: FutureBuilder<List<Quizz>>(
            future: QuizzService.getQuizz(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final questions = snapshot.data;
                return Row(
                  children: [
                    for (final questionTitle in questions!)
                      Padding(
                        padding: const EdgeInsets.only(left: 0.5),
                        child: QuestionCard(
                          question: questionTitle.question,
                          options: questionTitle.options,
                        ),
                      )
                  ],
                );
              } else if (snapshot.hasError) {
                return const Text('Error al cargar las preguntas');
              }
              return const CircularProgressIndicator();
            },
          )),
    );
  }
}

class QuestionCard extends StatelessWidget {
  final String question;
  final List<dynamic> options;

  const QuestionCard({
    super.key,
    required this.question,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(AppTheme.spacing6),
      decoration: BoxDecoration(
        color: AppTheme.gray100,
        border: Border.all(
          color: AppTheme.gray200,
          width: 1.0,
        ),
        borderRadius: AppTheme.borderRadiusXL,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Selecciona una respuesta",
            style: textTheme.bodyMediumSemiBold,
          ),
          AppTheme.spacingWidget2,
          Text(
            question,
            style: textTheme.headlineSmall,
          ),
          AppTheme.spacingWidget6,
          for (final option in options) Option(optionText: 'hola'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 5,
                child: ButtonSecondary(
                  'Anterior',
                  size: 2,
                ),
              ),
              AppTheme.spacingWidget5,
              const Expanded(
                flex: 5,
                child: ButtonPrimary(
                  'Siguiente',
                  size: 2,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Option extends StatelessWidget {
  final String optionText;
  const Option({
    super.key,
    required this.optionText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing5),
      margin: const EdgeInsets.only(bottom: AppTheme.spacing5),
      height: 48,
      decoration: BoxDecoration(
        color: AppTheme.white,
        border: Border.all(
          color: AppTheme.gray300,
          width: 1.0,
        ),
        borderRadius: AppTheme.borderRadiusXL,
      ),
      child: Text(
        optionText,
        style: textTheme.titleSmall?.copyWith(color: AppTheme.gray700),
      ),
    );
  }
}
