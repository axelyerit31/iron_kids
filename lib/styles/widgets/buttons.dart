import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';

class ButtonText extends StatelessWidget {
  final String text;

  const ButtonText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () {},
      child: Text(
        text.isEmpty? "" : text,
        style: AppTheme.labelLarge(context),
      ),
    );
  }
}