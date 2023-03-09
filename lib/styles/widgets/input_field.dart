import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final bool obscure;
  const InputField({
    super.key,
    required this.controller,
    required this.placeholder,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppTheme.gray50,
        borderRadius: AppTheme.borderRadiusL,
        border: Border.all(
          color: AppTheme.gray300,
          width: 1.0,
        ),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: placeholder,
            border: InputBorder.none,
            hintStyle: AppTheme.labelLarge(context)),
        obscureText: obscure,
      ),
    );
  }
}
