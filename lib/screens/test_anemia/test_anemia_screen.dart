import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iron_kids/nav_bar_routes.dart';
import 'package:iron_kids/screens/botones_muestra.dart';
import 'package:iron_kids/screens/login_screen.dart';
import 'package:iron_kids/screens/quizzes_screen.dart';
import 'package:iron_kids/screens/test_anemia/test_anemia_step1_screen.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets/buttons.dart';
import 'package:iron_kids/styles/widgets/screen_app.dart';

class TestAnemiaScreen extends StatefulWidget {
  const TestAnemiaScreen({super.key});

  @override
  State<TestAnemiaScreen> createState() => _TestAnemiaScreenState();
}

class _TestAnemiaScreenState extends State<TestAnemiaScreen> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKeys[indexTestAnemiaScreen],
      onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
        return Column(
          children: [
            AppTheme.spacingWidget10,
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/OtherResources%2Fninos_testAnemia_3x.png?alt=media&token=a4cf437b-a4dd-4d05-a591-6cced4ffdb88"))
                ),
              ),
            ),
            ScreenApp(child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("¡Un niño(a) saludable, será más feliz!", style: textTheme.headlineLarge,),
                AppTheme.spacingWidget4,
                const Text("Con nuestra app Niños de Hierro puedes saber si tu hijo(a) tiene anemia, además puedes llevar un control de sus citas, y orientación hacia una alimentación saludable."),
                AppTheme.spacingWidget6,
                ButtonPrimary(
                  "Iniciar test de anemia",
                  size: 2,
                  iconRight: Icons.arrow_forward_ios,
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (BuildContext context) => const TestAnemiaFirstStepScreen()
                      )
                    );
                  },
                ),
                AppTheme.spacingWidget8,
              ],
            ))
          ],
        );
      }
      )
    );
  }
}


class PantallasPrueba extends StatelessWidget {
  const PantallasPrueba({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const LoginScreen()
              )
            );
          },
          child: const Text('Ir a Login'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const QuizzesScreen()
              )
            );
          },
          child: const Text('Ir a quizzes'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const BotonesMuestraScreen()
              )
            );
          },
          child: const Text('Ir a muestra de botones'),
        ),
      ],
    );
  }
}


