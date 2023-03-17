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

int pageIndex = 0;

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
          AppTheme.spacingWidget6,

          // Indicador de avance
          ScreenApp(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hierro: el superhéroe de la salud',
                      style: textTheme.bodyMediumSemiBold,
                    ),
                    Text(
                      pageIndex < optionsValues.length ? '${pageIndex + 1} de ${optionsValues.length}' : "Finalizado",
                      style: textTheme.bodyMediumSemiBold.copyWith(
                        color: AppTheme.gray600,
                      ),
                    ),
                  ],
                ),
                AppTheme.spacingWidget6,

                // Indicadores de avance
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < optionsValues.length; i++)
                      Container(
                        width: screenW * 1/5,
                        height: 2,
                        decoration: BoxDecoration(
                          color: i <= pageIndex ? AppTheme.primary600 : AppTheme.gray100,
                        ),
                      ),
                  ],
                ),
              ],
            )
          ),
          
          AppTheme.spacingWidget9,

          // Card con preguntas
          Expanded(
            child: FutureBuilder<List<Quizz>>(
              future: QuizzService.getQuizz(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final questions = snapshot.data;
                  questionsG = questions;
                  return PageView(
                    onPageChanged: (value) {
                      setState(() {
                        pageIndex = value;
                      });
                    },
                    controller: _pageController,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    pageSnapping: true,
                    children: [
                      for (int i = 0; i < questions!.length + 1; i++)
                        i < questions.length
                        ? Padding(
                            padding:
                              const EdgeInsets.symmetric(horizontal: AppTheme.spacing6),
                            child: _questionCard(
                              index: i,
                              question: questions[i].question,
                              options: questions[i].options,
                              listSelected: optionsValues[i]
                            ),
                          )
                        : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing6),
                          child: Container(
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
                                    "Felicidades, respondiste todo correctamente",
                                    style: textTheme.headlineMedium,
                                  ),

                                  AppTheme.spacingWidget2,
                        
                                  Text(
                                    "Obtuviste 20 puntos.",
                                    style: textTheme.bodyMediumSemiBold.copyWith(color: AppTheme.gray600),
                                  ),
                        
                                  AppTheme.spacingWidget2,
                        
                                  Expanded(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/Ilustraciones%2Fself_confidence.png?alt=media&token=f85a584d-a25f-4751-8152-ba0cf635aa23"))
                                        )
                                    )
                                  ),
                        
                                  AppTheme.spacingWidget4,
                        
                                  ButtonPrimary(
                                    "Ir a Perfil",
                                    size: 2,
                                    onPressed: () {
                                      _pageController.jumpToPage(0);
                                      Navigator.pop(context);
                                      selectedIndexGlobal.value = indexPerfilMadreScreen;
                                    },
                                  )
                                  
                                ],
                              ),
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
          AppTheme.spacingWidget9,
        ],
      ),
    );
  }

  Widget _questionCard({required int index, required List<bool> listSelected, required String question, required List<dynamic> options}) {
    return Container(
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
                        pageIndex - 1,
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
                    pageIndex < optionsValues.length -1 ? 'Siguiente' : 'Finalizar',
                    size: 2,
                    onPressed: () {
                      _pageController.animateToPage(
                        pageIndex + 1,
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