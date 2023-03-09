import 'package:flutter/material.dart';
import 'package:iron_kids/main.dart';
import 'package:iron_kids/styles/app_theme.dart';
export 'package:iron_kids/styles/widgets/button_text.dart';
export 'package:iron_kids/styles/widgets/input_field.dart';

// Botones

// Cards de receta
class CardRecetaSmall extends StatelessWidget {
  final String titulo;
  final String tiempoCocina;
  final int likes;
  final String edad;

  const CardRecetaSmall({Key? key, required this.titulo, required this.tiempoCocina, required this.likes, required this.edad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppTheme.borderRadiusL,
        color: AppTheme.gray100,
      ),
      child: SizedBox(
              width: screenW * 1/3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // Imagen de receta y titulo
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      AppTheme.borderRadiusL,
                  color: AppTheme.gray600
                ),
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.spacing4),
                  child: Text(
                    titulo,
                    style: textTheme.bodyMediumSemiBold.copyWith(color: AppTheme.white),
                  ),
                ),
              ),
            ),
            
            AppTheme.spacingWidget2,
            
            // Datos de receta
            Padding(
              padding: const EdgeInsets.all(AppTheme.spacing3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                              
                      // Tiempo de cocina
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.timer_outlined, color: AppTheme.gray500),
                          const SizedBox(width: 4),
                          Text(tiempoCocina, style: AppTheme.bodySmallMedium(context).copyWith(color: AppTheme.gray500)),
                        ],
                      ),
                                                         
                      // Likes
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.thumb_up_outlined, color: AppTheme.gray500),
                          const SizedBox(width: 4),
                          Text(likes.toString(), style: AppTheme.bodySmallMedium(context).copyWith(color: AppTheme.gray500)),
                        ],
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 8),
                 
                  // Edad de niño
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.child_care, color: AppTheme.gray500),
                      const SizedBox(width: 4),
                      Text(edad, style: AppTheme.bodySmallMedium(context).copyWith(color: AppTheme.gray500)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}