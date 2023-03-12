import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';


class CardHijo extends StatelessWidget {
  // Hijo
  final String linkImg;
  final String nombre;

  final bool border;


  const CardHijo({
    super.key,
    required this.linkImg,
    required this.nombre,
    this.border = false,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        border: border ? Border.all(color: AppTheme.primary500, width: 2) : null,
        borderRadius: AppTheme.borderRadiusL,
        color: AppTheme.gray100,
      ),
      child: InkWell(
        borderRadius: AppTheme.borderRadiusL,
        onTap: () {
          
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacing4,
            vertical: AppTheme.spacing5,
          ),
          child: Column(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(linkImg),
                  ),
                ),
              ),
              AppTheme.spacingWidget4,
              Text(nombre, style: textTheme.titleSmall),
            ],
          ),
        ),
      ),
    );
  }
}