import 'package:flutter/material.dart';
import 'package:iron_kids/screens/botones_muestra.dart';
import 'package:iron_kids/screens/login_screen.dart';
import 'package:iron_kids/screens/recetas_screen.dart';
import 'package:iron_kids/screens/quizzes_screen.dart';

class TestAnemiaScreen extends StatelessWidget {
  const TestAnemiaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RecetasScreen()),
                );
              },
              child: const Text('Ir a Perfil Madre'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text('Ir a Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QuizzesScreen()),
                );
              },
              child: const Text('Ir a quizzes'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BotonesMuestraScreen()),
                );
              },
              child: const Text('Ir a muestra de botones'),
            ),
          ],
        ),
      );
  }
}