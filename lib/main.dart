import 'package:flutter/material.dart';
import 'package:iron_kids/screens/login_screen.dart';
import 'package:iron_kids/screens/mediafeed_screen.dart';
import 'package:iron_kids/screens/perfil_screen.dart';

void main() {
  runApp(const MyApp());
}

<<<<<<< HEAD
=======
double screenW = 0;
double screenH = 0;

>>>>>>> bf3810d8561e3835880969c8399deb8cfdb069ca
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
        primarySwatch: Colors.pink,
        textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 16,))
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    screenH = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    screenW = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi aplicación'),
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
                  MaterialPageRoute(builder: (context) => PerfilScreen()),
                );
              },
              child: const Text('Ir a Perfil Madre'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: const Text('Ir a Login'),
            ),
          ],
        ),
      ),
    );
  }
}
