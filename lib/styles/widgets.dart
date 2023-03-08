import 'package:flutter/material.dart';
import 'package:iron_kids/styles/appTheme.dart';

// botones

//Inputs
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
        obscureText: true,
      ),
    );
  }
}
