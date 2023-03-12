import 'package:flutter/material.dart';

MyTextTheme textTheme = MyTextTheme();

// ThemeData donde se definen los varlores propios
ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: AppTheme.white,
  primarySwatch: myPrimarySwatch,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: AppTheme.primary500,
    secondary: AppTheme.primary500,
    background: Colors.white
  ),
  fontFamily: "Inter", 
  textTheme: MyTextTheme()
);

// Swatch de colores propios
const MaterialColor myPrimarySwatch = MaterialColor(
  0xFF2196F3,
  <int, Color>{
    50: Color(0xffffe5e6),
    100: Color(0xffffd6d7),
    200: Color(0xffffcccd),
    300: Color(0xffffa8aa),
    400: Color(0xffff8a8c),
    500: Color(0xffff686b),
    600: Color(0xfff13a3e),
    700: Color(0xffd0181b),
    800: Color(0xffaa2a2c),
    900: Color(0xff772f30),
  },
);

// TextTheme con los estilos Material3 modificados, y estilos propios añadidos
class MyTextTheme extends TextTheme {
  MyTextTheme({
    TextStyle? headlineLarge,
    TextStyle? headlineMedium,
    TextStyle? headlineSmall,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
  }) : super(
          headlineLarge:
              const TextStyle(fontFamily: "DMSerifDisplay", fontSize: 32),
          headlineMedium:
              const TextStyle(fontFamily: "DMSerifDisplay", fontSize: 28),
          headlineSmall:
              const TextStyle(fontFamily: "DMSerifDisplay", fontSize: 24),
          titleMedium:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          titleSmall:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(fontSize: 18, color: AppTheme.gray700),
          bodyMedium: TextStyle(fontSize: 16, color: AppTheme.gray700),
          bodySmall: TextStyle(fontSize: 14, color: AppTheme.gray700),
          labelLarge: TextStyle(
              fontSize: 16,
              color: AppTheme.gray600,
              fontWeight: FontWeight.w400),
          labelMedium: TextStyle(fontSize: 14, color: AppTheme.gray600),
          labelSmall: TextStyle(fontSize: 12, color: AppTheme.gray600),
        );

  TextStyle bodyMediumSemiBold = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.gray700);
  TextStyle bodySmallMedium = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: AppTheme.gray700);
  TextStyle bodySmallSemiBold = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w600, color: AppTheme.gray700);
}

// Bordes redondeados, colores primarios, grises, spacing, spacingWidget, 
class AppTheme {

  // Borde Redondeados
  static BorderRadius borderRadiusXL = BorderRadius.circular(40);
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
  static SizedBox spacingWidget1 =
      const SizedBox(width: spacing1, height: spacing1);
  static SizedBox spacingWidget2 =
      const SizedBox(width: spacing2, height: spacing2);
  static SizedBox spacingWidget3 =
      const SizedBox(width: spacing3, height: spacing3);
  static SizedBox spacingWidget4 =
      const SizedBox(width: spacing4, height: spacing4);
  static SizedBox spacingWidget5 =
      const SizedBox(width: spacing5, height: spacing5);
  static SizedBox spacingWidget6 =
      const SizedBox(width: spacing6, height: spacing6);
  static SizedBox spacingWidget7 =
      const SizedBox(width: spacing7, height: spacing7);
  static SizedBox spacingWidget8 =
      const SizedBox(width: spacing8, height: spacing8);
  static SizedBox spacingWidget9 =
      const SizedBox(width: spacing9, height: spacing9);
  static SizedBox spacingWidget10 =
      const SizedBox(width: spacing10, height: spacing10);

  //Primary Color Scale
  static Color primary50 = const Color(0xffffe5e6);
  static Color primary100 = const Color(0xffffd6d7);
  static Color primary200 = const Color(0xffffcccd);
  static Color primary300 = const Color(0xffffa8aa);
  static Color primary400 = const Color(0xffff8a8c);
  static const Color primary500 = Color(0xffff686b);
  static Color primary600 = const Color(0xfff13a3e);
  static Color primary700 = const Color(0xffd0181b);
  static Color primary800 = const Color(0xffaa2a2c);
  static Color primary900 = const Color(0xff772f30);

  //Gray Scale
  static const Color white = Color(0xffffffff);
  static Color gray50 = const Color(0xfffcfcfd);
  static Color gray100 = const Color(0xffF3F8FC);
  static Color gray200 = const Color(0xffe7eaf0);
  static Color gray300 = const Color(0xffcfd6df);
  static Color gray400 = const Color(0xffabb6c5);
  static Color gray500 = const Color(0xff8898a9);
  static Color gray600 = const Color(0xff6c7b91);
  static Color gray700 = const Color(0xff475068);
  static Color gray800 = const Color(0xff2d3748);
  static Color gray900 = const Color(0xff16192c);

  

  // Estilos de Texto
  static TextStyle headlineLarge(BuildContext context) {
    return themeData.textTheme.headlineLarge!
        .copyWith(fontFamily: "DMSerifDisplay", fontSize: 32);
  }

  static TextStyle headlineMedium(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .headlineMedium!
        .copyWith(fontFamily: "DMSerifDisplay", fontSize: 28);
  }

  static TextStyle headlineSmall(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .headlineSmall!
        .copyWith(fontFamily: "DMSerifDisplay", fontSize: 24);
  }

  static TextStyle titleMedium(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(fontSize: 20, fontWeight: FontWeight.w600);
  }

  static TextStyle titleSmall(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .titleSmall!
        .copyWith(fontSize: 16, fontWeight: FontWeight.w600);
  }

  static TextStyle bodyLarge(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(fontSize: 18, color: gray700);
  }

  static TextStyle bodyMedium(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontSize: 16, color: gray700);
  }

  static TextStyle bodyMediumSemiBold(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: gray700);
  }

  static TextStyle bodySmall(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodySmall!
        .copyWith(fontSize: 14, color: gray700);
  }

  static TextStyle bodySmallMedium(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodySmall!
        .copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: gray700);
  }

  static TextStyle bodySmallSemiBold(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodySmall!
        .copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: gray700);
  }

  static TextStyle labelLarge(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .labelMedium!
        .copyWith(fontSize: 16, color: gray600);
  }

  static TextStyle labelMedium(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .labelMedium!
        .copyWith(fontSize: 14, color: gray600);
  }

  static TextStyle labelSmall(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall!.copyWith(
          fontSize: 11,
        );
  }

}


