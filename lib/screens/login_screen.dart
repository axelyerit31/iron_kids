import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets.dart';

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FormInput(
              emailControllerP: _emailController,
              passwordControllerP: _passwordController,
            ),
          ],
        ),
      ),
    );
  }
}

//Image Background

//Forms
class FormInput extends StatelessWidget {
  TextEditingController emailControllerP = TextEditingController();
  TextEditingController passwordControllerP = TextEditingController();
  FormInput(
      {super.key,
      required this.emailControllerP,
      required this.passwordControllerP});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.gray500,
        borderRadius: AppTheme.borderRadiusXL,
      ),
      child: Column(
        children: [
          Text(
            '¡Bienvenido de vuelta!',
            style: AppTheme.headlineSmall(context),
          ),
          AppTheme.spacingWidget3, //espaciador
          Text(
            'Ingresa tus datos en la parte de abajo',
            style: AppTheme.bodySmallMedium(context),
          ),
          AppTheme.spacingWidget7, //espaciador
          InputField(
            controller: emailControllerP,
            placeholder: 'Ingresa tu correo electrónico',
          ),
          AppTheme.spacingWidget5, //espaciador
          InputField(
            controller: passwordControllerP,
            placeholder: 'Ingresa tu contraseña',
            obscure: true,
          ),
          AppTheme.spacingWidget5,
          Text(
            '¿Olvidaste tu contraseña?',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: AppTheme.gray500,
              fontSize: 13, //Mencionar a Axel sobre este inconveniente
            ),
          ),
          AppTheme.spacingWidget5,
          const ButtonUI(text: 'Inicia sesión'),
        ],
      ),
    );
  }
}

//Widget boton
class ButtonUI extends StatelessWidget {
  final String text;

  const ButtonUI({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Implementar la lógica de autenticación aquí
        final String email = _emailController.text.trim();
        final String password = _passwordController.text.trim();
        // Validar las credenciales y continuar a la siguiente pantalla
      },
      style: ElevatedButton.styleFrom(
        primary: AppTheme.primary500,
        minimumSize: const Size(350, 58),
        shape: RoundedRectangleBorder(
          borderRadius:
              AppTheme.borderRadiusL, // personaliza el radio de los bordes
        ),
      ),
      child: Text((text != null) ? text : 'Inserta texto'),
    );
  }
}
