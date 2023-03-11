import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets/buttons.dart';


class PublicacionVencedores extends StatelessWidget {
  // Usuario
  final String usuarioLinkImg;
  final String usuario;
  final String puntos;

  // Publicacion
  final String fecha;
  final String body;

  // Hijo
  final String hijoLinkImg;
  final String hijo;

  const PublicacionVencedores({Key? key, required this.usuarioLinkImg, required this.usuario, required this.fecha, required this.puntos, required this.hijoLinkImg, required this.hijo, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardPublicacion(
      child: Column(
        children: [

          // Datos de usuario
          PublicacionesHeader(usuarioLinkImg: usuarioLinkImg, usuario: usuario, fecha: fecha, puntos: puntos),
          
          AppTheme.spacingWidget5,
          
          // Contenido vencedor
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: AppTheme.borderRadiusM,
              color: AppTheme.white
            ),
            padding: const EdgeInsets.all(AppTheme.spacing3),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(hijoLinkImg.isEmpty ? 'https://via.placeholder.com/50x50' : hijoLinkImg),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                AppTheme.spacingWidget5,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hijo, style: textTheme.titleSmall,),
                      AppTheme.spacingWidget2,
                      const Text(
                        '¡Ha logrado vencer a la anemia! 🎉💪',
                      ),
                    ],
                  ),
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
  final String usuarioLinkImg;
  final String usuario;
  final String puntos;

  // Publicacion
  final String fecha;
  final String body;

  // Receta
  final String recetaTitulo;
  final String recetaLinkImg;

  
  const PublicacionExperiencias({Key? key, required this.usuarioLinkImg, required this.usuario, required this.fecha, required this.puntos, required this.recetaTitulo, required this.recetaLinkImg, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardPublicacion(
      child: Column(
        children: [

          // Datos de usuario
          PublicacionesHeader(usuarioLinkImg: usuarioLinkImg, usuario: usuario, fecha: fecha, puntos: puntos),

          AppTheme.spacingWidget5,
          
          // Contenido receta
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: AppTheme.borderRadiusM,
              color: AppTheme.white
            ),
            padding: const EdgeInsets.only(right: AppTheme.spacing3),
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: AppTheme.borderRadiusM,
                    image: DecorationImage(
                      image: NetworkImage(recetaLinkImg.isEmpty ? 'https://via.placeholder.com/50x50' : recetaLinkImg),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                AppTheme.spacingWidget5,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(child: Text('Mi experiencia preparando 😋🍽', style: textTheme.bodyMedium)),
                      AppTheme.spacingWidget2,
                      Text(recetaTitulo, style: textTheme.titleSmall,),
                    ],
                  ),
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

  // Noticia
  final String noticiaLinkImg;
  final String noticiaFecha;
  final String noticiaTitulo;
  final String noticiaBody;
  final String noticiaLink;
  
  const PublicacionNoticias({Key? key, required this.fecha, required this.noticiaLinkImg, required this.noticiaFecha, required this.noticiaTitulo, required this.noticiaBody, required this.noticiaLink}) : super(key: key);

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
                  
                  AppTheme.spacingWidget2,

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
              image: DecorationImage(
                image: NetworkImage(noticiaLinkImg.isEmpty ? 'https://via.placeholder.com/50x50' : noticiaLinkImg),
                fit: BoxFit.cover
              )
            ),
            height: 200,
          ),
          
          AppTheme.spacingWidget5,
          
          // Contenido Noticia
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(noticiaFecha, style: textTheme.bodySmall!.copyWith(color: AppTheme.gray500),),

              AppTheme.spacingWidget4,

              Text(noticiaTitulo, style: textTheme.titleMedium),

              AppTheme.spacingWidget4,

              Text(noticiaBody),
            ],
          ),
          
          AppTheme.spacingWidget5,

          const ButtonOutlined(
            "La Republica",
            iconRight: Icons.arrow_forward_ios,
          )
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

class PublicacionesHeader extends StatelessWidget {
  const PublicacionesHeader({
    Key? key,
    required this.usuarioLinkImg,
    required this.usuario,
    required this.fecha,
    required this.puntos,
  }) : super(key: key);

  final String usuarioLinkImg;
  final String usuario;
  final String fecha;
  final String puntos;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        // Imagen Usuario
        Material(
          elevation: 0,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          color: Colors.transparent,
          child: Ink.image(
            image: NetworkImage(usuarioLinkImg.isEmpty ? 'https://via.placeholder.com/50x50' : usuarioLinkImg),
            width: 50,
            height: 50,
            child: InkWell(
              onTap: () {},
            ),
          ),
        ),
        
        AppTheme.spacingWidget4,
        
        // Datos usuario y fecha
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Nombre usuario y fecha
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
            
            AppTheme.spacingWidget2,

            // Puntos
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
    );
  }
}
