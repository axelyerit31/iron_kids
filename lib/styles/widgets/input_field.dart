import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final bool obscure;
  final IconData? iconLeft;
  final IconData? iconRight;
  final String label;
  final VoidCallback? onIconRightPressed;
  final TextInputType? keyboardType;
  const InputField({
    super.key,
    required this.controller,
    required this.placeholder,
    this.obscure = false,
    this.iconLeft,
    this.iconRight,
    this.onIconRightPressed,
    this.label = "",
    this.keyboardType = TextInputType.text
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != "")
          Column(
            children: [
              Text(
                label,
                style: textTheme.bodyMedium!.copyWith(color: AppTheme.gray700),
              ),
              AppTheme.spacingWidget3,
            ],
          ),
        Container(
            height: buttonHeightL,
            padding: EdgeInsets.only(
              top: AppTheme.spacing3,
              bottom: AppTheme.spacing3,
              left: iconLeft == null ? AppTheme.spacing4 : AppTheme.spacing2,
              right: iconRight == null ? AppTheme.spacing4 : AppTheme.spacing2,
            ),
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
              keyboardType: keyboardType,
              controller: controller,
              style: textTheme.labelLarge!.copyWith(color: AppTheme.gray700),
              decoration: InputDecoration(
                prefixIcon: iconLeft == null ? null : Icon(iconLeft, color: AppTheme.gray400),
                suffixIcon: iconRight == null ? null : Material(
                  child: IconButton(
                    splashRadius: 20,
                    icon: Icon(iconRight, color: AppTheme.gray400,),
                    onPressed: onIconRightPressed ?? () {},
                  ),
                ),
                hintText: placeholder,
                border: InputBorder.none,
                hintStyle: textTheme.labelLarge!.copyWith(color: AppTheme.gray400)
              ),
              obscureText: obscure,
            )),
      ],
    );
  }
}
