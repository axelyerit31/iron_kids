import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  final ScrollController _scrollController = ScrollController();
  List<Quizz>? questionsG;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
            ScrollDirection.forward ||
        _scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
      int currentPageIndex = getCurrentPageIndex();
      // Aquí puede hacer lo que quiera con el índice de la página actual, por ejemplo:
      // setState(() { currentPage = currentPageIndex; });

      if (questionsG![0] == 0) {}
      questionsG![1].id;
    }
  }

  int getCurrentPageIndex() {
    double pageWidth = MediaQuery.of(context).size.width -
        16; // reemplaza el 16 con el padding que estés utilizando
    double scrollOffset = _scrollController.offset;
    int currentPage = (scrollOffset / pageWidth).floor();
    return currentPage;
  }

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
      body: Column(
        children: [
          AppTheme.spacingWidget8,
          const CardProgress(),
          AppTheme.spacingWidget9,
          SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: FutureBuilder<List<Quizz>>(
                future: QuizzService.getQuizz(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final questions = snapshot.data;
                    questionsG = questions;
                    return Row(
                      children: [
                        for (final questionTitle in questions!)
                          Padding(
                            padding:
                                const EdgeInsets.only(left: AppTheme.spacing9),
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
        ],
      ),
    );
  }
}

//Contenedor del progreso de las preguntas
class CardProgress extends StatelessWidget {
  const CardProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        width: screenW * 5 / 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hierro, el super héroe de la salud',
                  style: textTheme.bodyMediumSemiBold,
                ),
                Text(
                  '1 de 4',
                  style: textTheme.bodyMediumSemiBold.copyWith(
                    color: AppTheme.gray600,
                  ),
                ),
              ],
            ),
            AppTheme.spacingWidget6,
            //esto lo puse asi por mientras xd, solo para ver como se ve T_T
            Container(
              width: double.infinity,
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: AppTheme.primary600,
                      ),
                    ),
                  ),
                  AppTheme.spacingWidget4,
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: AppTheme.primary100,
                      ),
                    ),
                  ),
                  AppTheme.spacingWidget4,
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: AppTheme.primary100,
                      ),
                    ),
                  ),
                  AppTheme.spacingWidget4,
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: AppTheme.primary100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
} //Tarjetas de las preguntas

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
      // AQUI LE PUSE EL ANCHO ESPECIFICO
      width: screenW * 6 / 7,
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
          for (final option in options) Option(optionText: option),
          AppTheme.spacingWidget8,
          SizedBox(
            width: 200,
            child: Row(
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
