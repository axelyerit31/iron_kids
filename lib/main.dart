import 'package:flutter/material.dart';
import 'package:iron_kids/screens/botones_muestra.dart';
import 'package:iron_kids/screens/login_screen.dart';
import 'package:iron_kids/screens/mediafeed_screen.dart';
import 'package:iron_kids/screens/perfil_screen.dart';

import 'package:iron_kids/screens/quizzes_screen.dart';
import 'package:iron_kids/styles/app_theme.dart';

void main() {
  runApp(const MyApp());
}

double screenW = 0;
double screenH = 0;

int _selectedIndex = 0;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    screenH =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    screenW = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi aplicación'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,   
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
