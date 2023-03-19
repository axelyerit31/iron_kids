import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: AppTheme.borderRadiusL,
      child: Ink(
      decoration: BoxDecoration(
        color: AppTheme.gray200,
        borderRadius: AppTheme.borderRadiusL
      ),
      child: InkWell(
        borderRadius: AppTheme.borderRadiusL,
        splashColor: Colors.grey.withOpacity(0.5),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacing6,
            vertical: AppTheme.spacing5
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_back_ios,color:AppTheme.gray600, size: 20,),
              Text("Regresar", style: textTheme.labelLargeMedium,)
            ],
          )
        ),
        onTap: () {
          Navigator.maybePop(context);
        },
      ),
      ),
    );
  }
}