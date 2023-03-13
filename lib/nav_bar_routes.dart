import 'package:flutter/material.dart';
import 'package:iron_kids/screens/control_anemia_screen.dart';
import 'package:iron_kids/screens/mediafeed_screen.dart';
import 'package:iron_kids/screens/perfil_madre_screen.dart';
import 'package:iron_kids/screens/recetas_screen.dart';
import 'package:iron_kids/screens/test_anemia_screen.dart';

// Trabajando con el bottomnavigationbar y el ValueListenableBuilder
Widget recetasScreen = const RecetasScreen();
Widget testAnemiaScreen = const TestAnemiaScreen();
Widget mediaFeedScreen = const MediaFeedScreen();
Widget controlAnemiaScreen = const ControlAnemiaScreen();
Widget perfilMadreScreen = const PerfilMadreScreen();

List<Widget> pages = <Widget>[
  recetasScreen,
  testAnemiaScreen,
  mediaFeedScreen,
  controlAnemiaScreen,
  perfilMadreScreen,
];

int indexRecetasScreen = pages.indexOf(recetasScreen);
int indexTestAnemiaScreen = pages.indexOf(testAnemiaScreen);
int indexMediaFeedScreen = pages.indexOf(mediaFeedScreen);
int indexControlAnemiaScreen = pages.indexOf(controlAnemiaScreen);
int indexPerfilMadreScreen = pages.indexOf(perfilMadreScreen);


// Navigator State key para cada pantalla del nav bar
final GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> fourthTabNavKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> fifthTabNavKey = GlobalKey<NavigatorState>();

List<GlobalKey<NavigatorState>> navigatorKeys = [
  firstTabNavKey,
  secondTabNavKey,
  thirdTabNavKey,
  fourthTabNavKey,
  fifthTabNavKey,
];