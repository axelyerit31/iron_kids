import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iron_kids/screens/test_anemia/test_anemia_final_screen.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets.dart';

List<bool> _firstButton = [false, false];
List<bool> _secondButton = [false, false];
List<bool> _thirdButton = [false, false];

class TestAnemiaSecondStepScreen extends StatefulWidget {
  const TestAnemiaSecondStepScreen({super.key});

  @override
  State<TestAnemiaSecondStepScreen> createState() => _TestAnemiaSecondStepScreenState();
}

class _TestAnemiaSecondStepScreenState extends State<TestAnemiaSecondStepScreen> {

  void _onFirstPressed(List<bool> values) {
    setState(() {
      _firstButton = values;
    });
  }

  void _onSecondPressed(List<bool> values) {
    setState(() {
      _secondButton = values;
    });
  }

  void _onThirdPressed(List<bool> values) {
    setState(() {
      _thirdButton = values;
    });
  }

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
              Text("Parte 2/2", style: textTheme.titleSmall,),
              AppTheme.spacingWidget3,
              Text("Complete los siguientes datos sobre su hijo(a)", style: textTheme.headlineLarge),
      
      
              AppTheme.spacingWidget8,
      
              // Campos de texto
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [


                  ButtonPrimaryToggle(
                    labelHeader: "¿El peso de su hijo(a) fue adecuado al nacer?",
                    labelLeft: "Si",
                    labelRight: "No",
                    values: _firstButton,
                    onPressed: _onFirstPressed
                  ),

                  AppTheme.spacingWidget6,

                  ButtonPrimaryToggle(
                    labelHeader: "¿El nacimiento de su hijo(a) fue prematuro?",
                    labelLeft: "Si",
                    labelRight: "No",
                    values: _secondButton,
                    onPressed: _onSecondPressed
                  ),

                  AppTheme.spacingWidget6,

                  ButtonPrimaryToggle(
                    labelHeader: "¿Cuál es el sexo de su hijo(a)?",
                    labelLeft: "Masculino",
                    labelRight: "Femenino",
                    values: _thirdButton,
                    onPressed: _onThirdPressed
                  ),

                  AppTheme.spacingWidget6,

                  
      
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
                          builder: (BuildContext context) => const TestAnemiaFinalScreen()
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


class ButtonPrimaryToggle extends StatelessWidget {
  final String labelHeader;
  final String labelLeft;
  final List<bool> values;
  final String labelRight;
  final ValueChanged<List<bool>> onPressed;
  
  const ButtonPrimaryToggle({
    Key? key,
    required this.labelLeft,
    required this.labelRight,
    required this.labelHeader,
    required this.values,
    required this.onPressed,
  }) : super(key: key);

  void _onFirstPressed(){
      values[0] = true;
      values[1] = false;
      onPressed(values);
  }

  void _onSecondPressed(){
      values[0] = false;
      values[1] = true;
      onPressed(values);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          labelHeader,
          style: textTheme.bodyMedium!.copyWith(color: AppTheme.gray700),
        ),
        AppTheme.spacingWidget3,
        Row(
          children: [
            Expanded(
              child: values[0] ?
                ButtonPrimary(
                  labelLeft,
                  size: 2,
                  onPressed: _onFirstPressed
                ) :
                ButtonOutlined(
                  labelLeft,
                  size: 2,
                  onPressed: _onFirstPressed
                ),
            ),
            AppTheme.spacingWidget4,
            Expanded(
              child: values[1] ?
                ButtonPrimary(
                  labelRight,
                  size: 2,
                  onPressed: _onSecondPressed
                ) :
                ButtonOutlined(
                  labelRight,
                  size: 2,
                  onPressed: _onSecondPressed
                )
            ),
          ]
        ),
      ],
    );
  }
}