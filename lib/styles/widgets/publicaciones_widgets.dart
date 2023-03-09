import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';


class PublicacionVencedores extends StatelessWidget {
  final String usuario;
  final String fecha;
  final String puntos;
  final String hijo;
  final String body;
  
  const PublicacionVencedores({Key? key, required this.usuario, required this.fecha, required this.puntos, required this.hijo, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardPublicacion(
      child: Column(
        children: [

          // Datos de usuario
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              
              AppTheme.spacingWidget4,
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(usuario, style: textTheme.bodyMediumSemiBold,),
                      AppTheme.spacingWidget2,
                      Text('·', style: TextStyle(color: AppTheme.gray500)),
                      AppTheme.spacingWidget2,
                      Text(
                        fecha,
                        style: textTheme.bodySmall!.copyWith(color: AppTheme.gray500),
                      ),
                    ],
                  ),
                  
                  AppTheme.spacingWidget3,

                  Row(
                    children: [
                      Icon(Icons.emoji_events, size: 16, color: AppTheme.primary600,),
                      AppTheme.spacingWidget2,
                      Text(puntos, style: textTheme.bodySmallMedium.copyWith(color: AppTheme.primary600),),
                    ],
                  ),
                ],
              ),
            ],
          ),
          
          AppTheme.spacingWidget5,
          
          // Contenido vencedor
          Container(
            decoration: BoxDecoration(
              borderRadius: AppTheme.borderRadiusM,
              color: AppTheme.white
            ),
            padding: const EdgeInsets.all(AppTheme.spacing3),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                AppTheme.spacingWidget5,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(hijo, style: textTheme.titleSmall,),
                    AppTheme.spacingWidget2,
                    Text('¡Ha logrado vencer la anemia! 🎉💪', style: textTheme.bodyMedium,),
                  ],
                ),
              ],
            ),
          ),
          
          AppTheme.spacingWidget5,
          
          Text(body),
        ],
      ),
    );
  }
}

class PublicacionExperiencias extends StatelessWidget {
  // Usuario
  final String usuario;
  final String fecha;
  final String puntos;

  // Receta
  final String tituloReceta;
  final String linkRecetaImg;
  final String body;
  
  const PublicacionExperiencias({Key? key, required this.usuario, required this.fecha, required this.puntos, required this.tituloReceta, required this.linkRecetaImg, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardPublicacion(
      child: Column(
        children: [

          // Datos de usuario
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              
              AppTheme.spacingWidget4,
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(usuario, style: textTheme.bodyMediumSemiBold,),
                      AppTheme.spacingWidget2,
                      Text('·', style: TextStyle(color: AppTheme.gray500)),
                      AppTheme.spacingWidget2,
                      Text(
                        fecha,
                        style: textTheme.bodySmall!.copyWith(color: AppTheme.gray500),
                      ),
                    ],
                  ),
                  
                  AppTheme.spacingWidget3,

                  Row(
                    children: [
                      Icon(Icons.emoji_events, size: 16, color: AppTheme.primary600,),
                      AppTheme.spacingWidget2,
                      Text(puntos, style: textTheme.bodySmallMedium.copyWith(color: AppTheme.primary600),),
                    ],
                  ),
                ],
              ),
            ],
          ),
          
          AppTheme.spacingWidget5,
          
          // Contenido vencedor
          Container(
            decoration: BoxDecoration(
              borderRadius: AppTheme.borderRadiusM,
              color: AppTheme.white
            ),
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: AppTheme.borderRadiusM,
                    color: Colors.grey,
                  ),
                ),
                AppTheme.spacingWidget5,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mi experiencia preparando 😋🍽', style: textTheme.bodyMedium,),
                    AppTheme.spacingWidget2,
                    Text(tituloReceta, style: textTheme.titleSmall,),
                  ],
                ),
              ],
            ),
          ),
          
          AppTheme.spacingWidget5,
          
          Text(body),
        ],
      ),
    );
  }
}

class PublicacionNoticias extends StatelessWidget {
  // Usuario
  final String fecha;
  final String linkNoticiaImg;
  final String fechaNoticia;

  // Receta
  final String tituloNoticia;
  final String bodyNoticia;
  final String linkNoticia;
  
  const PublicacionNoticias({Key? key, required this.fecha, required this.linkNoticiaImg, required this.fechaNoticia, required this.tituloNoticia, required this.bodyNoticia, required this.linkNoticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardPublicacion(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          // Datos de usuario
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
              
              AppTheme.spacingWidget4,
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Niños de Hierro", style: textTheme.bodyMediumSemiBold,),
                      AppTheme.spacingWidget2,
                      Text('·', style: TextStyle(color: AppTheme.gray500)),
                      AppTheme.spacingWidget2,
                      Text(
                        fecha,
                        style: textTheme.bodySmall!.copyWith(color: AppTheme.gray500),
                      ),
                    ],
                  ),
                  
                  AppTheme.spacingWidget3,

                  Text("Noticias", style: textTheme.bodySmallMedium.copyWith(color: AppTheme.gray500)),
                ],
              ),
            ],
          ),
          
          AppTheme.spacingWidget5,
          
          // Imagen Noticia
          Container(
            decoration: BoxDecoration(
              borderRadius: AppTheme.borderRadiusM,
              color: AppTheme.gray400
            ),
            height: 200,
          ),
          
          AppTheme.spacingWidget5,
          
          // Contenido Noticia
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(fechaNoticia, style: textTheme.bodySmall!.copyWith(color: AppTheme.gray500),),

              AppTheme.spacingWidget4,

              Text(tituloNoticia, style: textTheme.titleMedium),

              AppTheme.spacingWidget4,

              Text(bodyNoticia),
            ],
          ),
          
          AppTheme.spacingWidget5,

          ElevatedButton(onPressed: () {}, child: const Text("La Republica"))
        ],
      ),
    );
  }
}

class CardPublicacion extends StatelessWidget {
  final Widget child;
  const CardPublicacion({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppTheme.borderRadiusL,
        color: AppTheme.gray100,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacing5),
        child: child
      ),
    );
  }
}

