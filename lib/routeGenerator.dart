import 'package:flutter/material.dart';
import 'package:iron_kids/main.dart';
import 'package:iron_kids/screens/botones_muestra.dart';
import 'package:iron_kids/screens/login_screen.dart';
import 'package:iron_kids/screens/quizzes_screen.dart';

// Navigator.of(context).pushNamed('/home');

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments;
    //print(args);
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/quizzes':
        return MaterialPageRoute(builder: (_) => const QuizzesScreen());
      case '/botonesMuestra':
        return MaterialPageRoute(builder: (_) => const BotonesMuestraScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}