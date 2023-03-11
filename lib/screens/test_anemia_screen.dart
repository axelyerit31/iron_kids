import 'package:flutter/material.dart';
import 'package:iron_kids/screens/botones_muestra.dart';
import 'package:iron_kids/screens/login_screen.dart';
import 'package:iron_kids/screens/mediafeed_screen.dart';
import 'package:iron_kids/screens/perfil_screen.dart';
import 'package:iron_kids/screens/quizzes_screen.dart';

class TestAnemiaScreen extends StatelessWidget {
  const TestAnemiaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pruebas"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MediaFeedScreen()),
                );
              },
              child: const Text('Ir a Media Feed'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PerfilScreen()),
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
      ),
    );
  }
}