import 'package:flutter/material.dart';
import 'package:iron_kids/main.dart';
import 'package:iron_kids/nav_bar_routes.dart';
import 'package:iron_kids/screens/test_anemia/test_anemia_step1_screen.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets.dart';

class TestAnemiaFinalScreen extends StatelessWidget {
  const TestAnemiaFinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ScreenApp(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTheme.spacingWidget8,
              const ButtonBack(),
              
              AppTheme.spacingWidget8,
      
              // Header
              Text("Resultados de: ${controllerNombreHijo.text}", style: textTheme.headlineLarge),
      
              AppTheme.spacingWidget6,

              // Cards info
              SizedBox(
                height: screenH * 1/3,
                child: Row(
                  children: [
                    CardMensajeAnemia(
                      mensaje: "Según los datos brindados, su hijo presenta anemia.",
                      icon: Icons.water_drop,
                      contentColor: AppTheme.white,
                      backgroundColor: AppTheme.primary600,
                      backgroundIconColor: AppTheme.primary500,
                    ),

                    AppTheme.spacingWidget6,
                    
                    CardMensajeAnemia(
                      mensaje: "Se encuentra con anemia, pues su nivel de hemoglobina es de 11.0 g/dl, y no son los niveles indicados para su edad.",
                      icon: Icons.info,
                      contentColor: AppTheme.gray600,
                      backgroundColor: AppTheme.gray100,
                      backgroundIconColor: AppTheme.gray200,
                    ),
                  ],
                ),
              ),

              AppTheme.spacingWidget8,

              // comidas recomendadas
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Comidas recomendadas", style: textTheme.titleMedium),

                  AppTheme.spacingWidget6,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CardRecetaLarge(linkImg: "https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/Recetas%2Fchaufa_sangrecita.png?alt=media&token=b983eb50-fcc3-46d8-a09b-a4220f858f77", titulo: "Chaufa de Sangrecita", tiempo: "12 min", likes: "126", edad: "12 a 23 meses", liked: true,),
                      
                      AppTheme.spacingWidget6,

                      const CardRecetaLarge(linkImg: "https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/Recetas%2Fpapilla_pescado.png?alt=media&token=085d255c-5c94-45ab-b87a-7fd3fe850213", titulo: "Papilla de Pescado", tiempo: "10 min", likes: "30", edad: "9 a 11 meses", liked: false)
                    ],
                  ),

                  AppTheme.spacingWidget6,

                  ButtonPrimary(
                    "Terminar",
                    size: 2,
                    onPressed: () {
                      selectedIndexGlobal.value = indexControlAnemiaScreen;
                    },
                  ),
                ],
              )
    
            ],
          )
        ),
      )
    );
  }
}

class CardMensajeAnemia extends StatelessWidget {
  final String mensaje;
  final Color backgroundColor;
  final IconData icon;
  final Color contentColor;
  final Color backgroundIconColor;
  const CardMensajeAnemia({
    super.key, required this.mensaje, required this.backgroundColor, required this.contentColor, required this.backgroundIconColor, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: AppTheme.borderRadiusL
        ),
        padding: const EdgeInsets.symmetric(
          vertical: AppTheme.spacing8,
          horizontal: AppTheme.spacing5
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icono
            Container(
              decoration: BoxDecoration(
                color: backgroundIconColor,
                borderRadius: AppTheme.borderRadiusM
              ),
              padding: const EdgeInsets.all(AppTheme.spacing5),
              child: Icon(icon, size: 28, color:contentColor),
            ),
              
            AppTheme.spacingWidget6,
              
            // Texto
            Text(mensaje, style: textTheme.bodyLarge!.copyWith(color: contentColor))
          ],
        ),
      ),
    );
  }
}