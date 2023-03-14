import 'package:flutter/material.dart';
import 'package:iron_kids/styles/widgets.dart';

TextEditingController controller = TextEditingController();

class PerfilMadreEditar extends StatelessWidget {
  const PerfilMadreEditar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prueba editar pefil madre")
      ),
      body: ScreenApp(
        child: Center(
          child: Column(
            children: [
              InputField(
                controller: controller,
                placeholder: "Prueba",
                label: "Prueba label",
                iconRight: Icons.remove_red_eye_outlined,
              )
            ],
          ),
        ),
      )
    );
  }
}