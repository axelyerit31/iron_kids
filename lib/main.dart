import 'package:flutter/material.dart';
import 'package:iron_kids/nav_bar_routes.dart';
import 'package:iron_kids/route_generator.dart';
import 'package:iron_kids/styles/app_theme.dart';


void main() {
  runApp(const MyApp());
}

// Tamaños de pantalla
double screenW = 0;
double screenH = 0;

final ValueNotifier<int> selectedIndexGlobal = ValueNotifier<int>(2);


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
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
      selectedIndexGlobal.value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    screenH = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    screenW = MediaQuery.of(context).size.width;

    return ValueListenableBuilder(
      valueListenable: selectedIndexGlobal,
      builder: (BuildContext context, int value, child) {
        return WillPopScope(
          onWillPop: () async {
            final navigatorState = navigatorKeys[selectedIndexGlobal.value].currentState;
            if (navigatorState!.canPop()) {
              navigatorState.pop();
              return false;
            } else {
              return true;
            }
          },
          child: Scaffold(
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
                  icon: Icon(Icons.water_drop),
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
                  icon: Icon(Icons.person),
                  label: 'Perfil',
                ),
              ],
              currentIndex: selectedIndexGlobal.value, //New
              onTap: _onItemTapped,
            ),
            body: IndexedStack(
              index: value,
              children: pages,
            ),
          ),
        );
      }
    );
  }
}