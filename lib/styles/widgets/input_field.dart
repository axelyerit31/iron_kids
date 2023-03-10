import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final bool obscure;
  final Icon? iconLeft;
  final Icon? iconRight;
  const InputField({
    super.key,
    required this.controller,
    required this.placeholder,
    this.obscure = false,
    this.iconLeft,
    this.iconRight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
              prefixIcon: iconLeft,
              suffixIcon: iconRight,
              hintText: placeholder,
              border: InputBorder.none,
              hintStyle: AppTheme.bodySmall(context)
                  .copyWith(color: AppTheme.gray400)),
          obscureText: obscure,
        ));
  }
}
