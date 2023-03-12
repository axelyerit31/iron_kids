import 'package:flutter/material.dart';
import 'package:iron_kids/main.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets/buttons.dart';
import 'package:iron_kids/styles/widgets/screen_app.dart';


class PerfilMadreScreen extends StatelessWidget {
  const PerfilMadreScreen({super.key});

  @override
  Widget build(BuildContext context) {

  int puntajeMaximo = 100;
  int puntajeUsuario = 20;

    return Scaffold(
      body: ScreenApp(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Spacing 20px
            AppTheme.spacingWidget10,
  
            Text("Hola, Lupe Batallán", style: textTheme.headlineLarge,),

            //Spacing 20px
            AppTheme.spacingWidget6,

            // Usuario imagen, datos, barra de puntos
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // Imagen usuario
                    const CircleAvatar(
                      backgroundImage: NetworkImage('https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/Profile%2Fphoto_lupe.png?alt=media&token=b6be5f56-41e7-47a2-b240-97a9c3131690'),
                      radius: 45,
                    ),

                    // Datos y barra de puntos
                    SizedBox(
                      width: screenW * 2/3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppTheme.gray100,
                          borderRadius: AppTheme.borderRadiusL
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: AppTheme.spacing5,
                          horizontal: AppTheme.spacing6,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                      
                            // Niños
                            Column(
                              children: [
                                Icon(Icons.people_alt_outlined, color: AppTheme.gray700,),
                                Text("Niños", style: textTheme.titleSmall,),
                                Text("2", style: textTheme.bodyMedium,)
                              ],
                            ),
                      
                            AppTheme.spacingWidget8,
                      
                            // Region
                            Column(
                              children: [
                                Icon(Icons.pin_drop_outlined, color: AppTheme.gray700,),
                                Text("Región", style: textTheme.titleSmall,),
                                Text("Ica, Perú", style: textTheme.bodyMedium,)
                              ],
                            ),
                      
                            AppTheme.spacingWidget8,
                      
                            // Puntos
                            Column(
                              children: [
                                Icon(Icons.emoji_events_outlined, color: AppTheme.gray700,),
                                Text("Puntos", style: textTheme.titleSmall,),
                                Text(puntajeUsuario.toString(), style: textTheme.bodyMedium,)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                
                AppTheme.spacingWidget5,
          
                // Barra de puntos
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.gray100,
                    borderRadius: AppTheme.borderRadiusXL
                  ),
                  height: 25,
                  alignment: Alignment.centerLeft,
                  child: Stack(
                    children: [
                      FractionallySizedBox(
                        widthFactor: puntajeUsuario/puntajeMaximo,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: AppTheme.primary400,
                            borderRadius: AppTheme.borderRadiusXL
                          ),
                        ),
                      ),
                      Center(child: Text("$puntajeUsuario/$puntajeMaximo")),

                    ],
                  ),
                )
              ],
            ),

            AppTheme.spacingWidget6,
            
            Text(
              'Mis hijitos',
              style: textTheme.headlineSmall,
            ),

            AppTheme.spacingWidget4,
            
            Row(
              children: [
                ButtonIcon(
                  icon: Icons.add,
                  iconColor: AppTheme.gray500,
                  backgroundColor: AppTheme.gray100,
                  size: 1,
                ),

                AppTheme.spacingWidget5,

                // Hijo 1
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacing4,
                    vertical: AppTheme.spacing5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: AppTheme.borderRadiusL,
                    color: AppTheme.gray100,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/AvatarChild%2Fboy_avatar_1.png?alt=media&token=daea9e81-04a3-4e0d-9f4a-f8c6cb3cf0b8"))
                        ),
                      ),
                      AppTheme.spacingWidget4,
                      Text("Luquitas", style: textTheme.titleSmall)
                    ],
                  ),
                ),

                AppTheme.spacingWidget5,

                // Hijo 2
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacing4,
                    vertical: AppTheme.spacing5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: AppTheme.borderRadiusL,
                    color: AppTheme.gray100,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/AvatarChild%2Fboy_avatar_1.png?alt=media&token=daea9e81-04a3-4e0d-9f4a-f8c6cb3cf0b8"))
                        ),
                      ),
                      AppTheme.spacingWidget4,
                      Text("Luquitas", style: textTheme.titleSmall)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}