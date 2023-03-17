import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iron_kids/screens/test_anemia/test_anemia_step2_screen.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets.dart';

TextEditingController controllerNombreHijo = TextEditingController();
TextEditingController controllerNacimientoHijo = TextEditingController();
TextEditingController controllerPesoHijo = TextEditingController();
TextEditingController controllerHemoglobinaHijo = TextEditingController();

class TestAnemiaFirstStepScreen extends StatelessWidget {
  const TestAnemiaFirstStepScreen({super.key});

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
              Text("Parte 1/2", style: textTheme.titleSmall,),
              AppTheme.spacingWidget3,
              Text("Complete los siguientes datos sobre su hijo(a)", style: textTheme.headlineLarge),
      
      
              AppTheme.spacingWidget8,
      
              // Campos de texto
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InputField(
                    label: "¿Cuál es el nombre de su hijo(a)?",
                    controller: controllerNombreHijo, 
                    placeholder: "Nombre",
                    iconLeft: Icons.child_care,
                  ),
                  AppTheme.spacingWidget6,
                  InputField(
                    label: "¿En qué fecha nació su hijo(a)?",
                    controller: controllerNacimientoHijo, 
                    placeholder: "dd/mm/aa",
                    iconLeft: Icons.calendar_month_outlined,
                  ),
                  AppTheme.spacingWidget6,
                  InputField(
                    label: "¿Cuánto pesa su hijo(a)? (kg)",
                    controller: controllerPesoHijo, 
                    placeholder: "Peso en kilogramos",
                    iconLeft: Icons.calendar_month_outlined,
                    keyboardType: TextInputType.number,
                  ),
                  AppTheme.spacingWidget6,
                  InputField(
                    label: "¿Cuánta hemoglobina tiene su hijo(a)? (g/dl)",
                    controller: controllerHemoglobinaHijo, 
                    placeholder: "Nivel de hemoglobina",
                    iconLeft: Icons.calendar_month_outlined,
                    keyboardType: TextInputType.number,
                  ),
      
      
                  AppTheme.spacingWidget8,
      
                  // Boton
                  ButtonPrimary(
                    "Siguiente",
                    iconRight: Icons.arrow_forward_ios,
                    size: 2,
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (BuildContext context) => const TestAnemiaSecondStepScreen()
                        )
                      );
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