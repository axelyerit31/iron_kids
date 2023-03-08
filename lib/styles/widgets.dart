import 'package:flutter/material.dart';
import 'package:iron_kids/main.dart';
import 'package:iron_kids/styles/app_theme.dart';

// Botones
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

// Inputs
class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  const InputField({
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
      height: screenW * 1/3 * 3/2,
      width: screenW * 1/3,
      decoration: BoxDecoration(
        borderRadius: AppTheme.borderRadiusL,
        color: AppTheme.gray100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  style: AppTheme.bodyMediumSemiBold(context).copyWith(color: AppTheme.white),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(AppTheme.spacing2),
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
                    
                    
                    const SizedBox(height: 8),
                    
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
    );
  }
}