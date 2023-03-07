import 'package:flutter/material.dart';



class AppTheme {

  //Estilos de Texto
  static TextStyle headlineLarge(BuildContext context) {
    return Theme.of(context).textTheme.headlineLarge!.copyWith(
      fontFamily: "DMSerifDisplay",
    );
  }
  static TextStyle displayLarge(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium!.copyWith(
      fontFamily: "DMSerifDisplay",
    );
  }
  static TextStyle headlineSmall(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall!.copyWith(
      fontFamily: "DMSerifDisplay",
    );
  }
  static TextStyle titleLarge(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge!.copyWith(
    );
  }
  static TextStyle bodyLarge(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle labelLarge(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge!.copyWith(
      fontWeight: FontWeight.w600,
    );
  }

  // Borde Redondeados
  static BorderRadius borderRadiusL = BorderRadius.circular(16);
  static BorderRadius borderRadiusM = BorderRadius.circular(14);
  static BorderRadius borderRadiusS = BorderRadius.circular(10);

  //Spacing Double
  static const double spacing1 = 2;
  static const double spacing2 = 4;
  static const double spacing3 = 8;
  static const double spacing4 = 12;
  static const double spacing5 = 16;
  static const double spacing6 = 20;
  static const double spacing7 = 24;
  static const double spacing8 = 32;
  static const double spacing9 = 40;
  static const double spacing10 = 48;


  //Spacing Widget
  static SizedBox spacingWidget1 = const SizedBox(width: spacing1, height: spacing1);
  static SizedBox spacingWidget2 = const SizedBox(width: spacing2, height: spacing2);
  static SizedBox spacingWidget3 = const SizedBox(width: spacing3, height: spacing3);
  static SizedBox spacingWidget4 = const SizedBox(width: spacing4, height: spacing4);
  static SizedBox spacingWidget5 = const SizedBox(width: spacing5, height: spacing5);
  static SizedBox spacingWidget6 = const SizedBox(width: spacing6, height: spacing6);
  static SizedBox spacingWidget7 = const SizedBox(width: spacing7, height: spacing7);
  static SizedBox spacingWidget8 = const SizedBox(width: spacing8, height: spacing8);
  static SizedBox spacingWidget9 = const SizedBox(width: spacing9, height: spacing9);
  static SizedBox spacingWidget10 = const SizedBox(width: spacing10, height: spacing10);

  //Colores
  
}

