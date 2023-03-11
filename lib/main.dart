import 'package:flutter/material.dart';
import 'package:iron_kids/screens/control_anemia_screen.dart';
import 'package:iron_kids/screens/mediafeed_screen.dart';
import 'package:iron_kids/screens/recetas_screen.dart';
import 'package:iron_kids/screens/test_anemia_screen.dart';
import 'package:iron_kids/styles/app_theme.dart';

void main() {
  runApp(const MyApp());
}

double screenW = 0;
double screenH = 0;



// Lista de pantallas en el botttomNavigationBare
const List<Widget> _pages = <Widget>[
  RecetasScreen(),
  TestAnemiaScreen(),
  MediaFeedScreen(),
  ControlAnemiaScreen(),
  TestAnemiaScreen(),
];

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
  
  int _selectedIndex = 2;
  
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
                  onTap: () {},
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: AppTheme.gray600,
        selectedItemColor: AppTheme.primary500,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Recetas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.water_drop_outlined),
            label: 'Test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Control',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward_ios),
            label: 'Pruebas',
          ),
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages
      )
    );
  }
}
