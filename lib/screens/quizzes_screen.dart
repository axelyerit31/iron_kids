import 'package:flutter/material.dart';
import 'package:iron_kids/main.dart';
import 'package:iron_kids/models/quizzes.dart';
import 'package:iron_kids/nav_bar_routes.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets.dart';


List<List<bool>> optionsValues = [
  [false, false, false, false],
  [false, false, false, false],
  [false, false, false, false],
  [false, false, false, false],
];

PageController _pageController = PageController(initialPage: 0, keepPage: false);

class QuizzesScreen extends StatefulWidget {
  const QuizzesScreen({super.key});
  @override
  State<QuizzesScreen> createState() => _QuizzesScreenState();
}

class _QuizzesScreenState extends State<QuizzesScreen> {

  List<Quizz>? questionsG;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppTheme.gray800),
        shadowColor: AppTheme.gray50,
        elevation: 3,
        backgroundColor: AppTheme.white,
        toolbarHeight: screenH * 1 / 12,
        title: Text(
          "Niños de Hierro",
          style: textTheme.headlineLarge!.copyWith(color: AppTheme.gray800),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppTheme.spacing4),
            child: Material(
              elevation: 0,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              color: Colors.transparent,
              child: Ink.image(
                image: const NetworkImage('https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/Profile%2Fphoto_lupe.png?alt=media&token=b6be5f56-41e7-47a2-b240-97a9c3131690'),
                width: 50,
                height: 50,
                child: InkWell(
                  onTap: () {
                    // Yendo a la pantalla PerfilMadre
                    selectedIndexGlobal.value = indexPerfilMadreScreen;
                  },
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          AppTheme.spacingWidget8,
          const CardProgress(),
          AppTheme.spacingWidget9,
          Expanded(
            child: FutureBuilder<List<Quizz>>(
              future: QuizzService.getQuizz(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final questions = snapshot.data;
                  questionsG = questions;
                  return PageView(
                    controller: _pageController,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    pageSnapping: true,
                    children: [
                      for (int i = 0; i < questions!.length; i++)
                        Padding(
                          padding:
                            const EdgeInsets.symmetric(horizontal: AppTheme.spacing9),
                          child: _questionCard(
                            index: i,
                            question: questions[i].question,
                            options: questions[i].options,
                            listSelected: optionsValues[i]
                          ),
                        )
                    ],
                  );
                } else if (snapshot.hasError) {
                  return const Text('Error al cargar las preguntas');
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _questionCard({required int index, required List<bool> listSelected, required String question, required List<dynamic> options}) {return Container(
      // AQUI LE PUSE EL ANCHO ESPECIFICO
      width: screenW * 6 / 7,
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacing6,
        vertical: AppTheme.spacing8
      ),
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
            style: textTheme.bodyMediumSemiBold.copyWith(color: AppTheme.gray600),
          ),
          AppTheme.spacingWidget4,
          Text(
            question,
            style: textTheme.headlineSmall,
          ),
          AppTheme.spacingWidget6,
          for (int i = 0; i < options.length; i++)
            _option(
              indexCards: index,
              indexOptions: i,
              isSelected: listSelected[i],
              optionText: options[i]
            ),
          AppTheme.spacingWidget8,
          SizedBox(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 5,
                  child: ButtonSecondary(
                    'Anterior',
                    size: 2,
                    onPressed: () {
                      _pageController.animateToPage(
                        (_pageController.page?.round() ?? 0) - 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOutCubic
                      );
                    },
                  ),
                ),
                AppTheme.spacingWidget5,
                Expanded(
                  flex: 5,
                  child: ButtonPrimary(
                    'Siguiente',
                    size: 2,
                    onPressed: () {
                      _pageController.animateToPage(
                        (_pageController.page?.round() ?? 0) + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOutCubic
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _option({required int indexCards, required int indexOptions, required String optionText, required bool isSelected}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.spacing5,),
      child: Material(
        borderRadius: AppTheme.borderRadiusXL,
        color: isSelected ? AppTheme.primary50 : AppTheme.white,
        child: InkWell(
          onTap: () {
            setState(() {
              for (int i = 0; i < optionsValues[indexCards].length; i ++) {
                optionsValues[indexCards][i] = i == indexOptions ? !isSelected : false;
              }
            });
          },
          borderRadius: AppTheme.borderRadiusXL,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacing6,
              vertical: AppTheme.spacing6
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? AppTheme.primary500 : AppTheme.gray300,
                width: 1.0,
              ),
              borderRadius: AppTheme.borderRadiusXL,
            ),
            child: Text(
              optionText,
              style: textTheme.titleSmall?.copyWith(color: AppTheme.gray700),
            ),
          ),
        ),
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
            SizedBox(
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
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacing6,
        vertical: AppTheme.spacing8
      ),
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
            style: textTheme.bodyMediumSemiBold.copyWith(color: AppTheme.gray600),
          ),
          AppTheme.spacingWidget4,
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
    return Material(
      borderRadius: AppTheme.borderRadiusXL,
      color: AppTheme.white,
      child: InkWell(
        borderRadius: AppTheme.borderRadiusXL,
        onTap: () {},
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacing6,
            vertical: AppTheme.spacing6
          ),
          decoration: BoxDecoration(
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
        ),
      ),
    );
  }
}
