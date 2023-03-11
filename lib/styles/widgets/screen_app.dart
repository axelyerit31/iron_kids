import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';

class ScreenApp extends StatelessWidget {
  final Widget child;
  const ScreenApp({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: AppTheme.spacing6,
        right: AppTheme.spacing6,
        top: AppTheme.spacing6,
      ),
      child: child,
    );
  }
}