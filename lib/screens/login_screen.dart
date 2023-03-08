import 'package:flutter/material.dart';
import 'package:iron_kids/styles/appTheme.dart';

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
            Formlogin(),
          ],
        ),
      ),
    );
  }
}

class Formlogin extends StatelessWidget {
  Formlogin({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            '¡Bienvenido de vuelta!',
            style: AppTheme.headlineSmall(context),
          ),
          AppTheme.spacingWidget3, //espaciador
          Text(
            'Ingresa tus datos en la parte de abajo',
            style: AppTheme.bodyLarge(context),
          ),
          AppTheme.spacingWidget7,
          InputField(
            controller: _emailController,
            placeholder: 'Ingresa tu correo electrónico',
          ),
          AppTheme.spacingWidget5,
          InputField(
            controller: _passwordController,
            placeholder: 'Ingresa tu contraseña',
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            child: const Text('Login'),
            onPressed: () {
              // Implementar la lógica de autenticación aquí
              final String email = _emailController.text.trim();
              final String password = _passwordController.text.trim();
              // Validar las credenciales y continuar a la siguiente pantalla
            },
          )
        ],
      ),
    );
  }
}

class InputField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final String placeholder;
  InputField({
    super.key,
    required this.controller,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: AppTheme.borderRadiusL,
        border: Border.all(
          color: const Color.fromARGB(255, 223, 223, 223),
          width: 1.0,
        ),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: placeholder,
            border: InputBorder.none,
            hintStyle: AppTheme.labelLarge(context)),
        obscureText: true,
      ),
    );
  }
}
