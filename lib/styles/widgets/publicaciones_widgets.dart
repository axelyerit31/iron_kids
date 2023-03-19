import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iron_kids/main.dart';
import 'package:iron_kids/screens/quizzes_screen.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets/buttons.dart';

TextStyle styleBodyPublicaciones = textTheme.bodyMedium!.copyWith(height: 1.35);

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
          
          Text(body, style: styleBodyPublicaciones),
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
          
          Text(body, style: styleBodyPublicaciones),
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

              Text(noticiaBody, style: styleBodyPublicaciones),
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



class PublicacionConsejos extends StatelessWidget {
  // Usuario
  final String fecha;
  final List<List<Widget>> childrens;
  
  const PublicacionConsejos({Key? key, required this.fecha, required this.childrens, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardPublicacion(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.spacing5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          // Datos de usuario
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
          
                // imagen usuario
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
          
                    Text("Consejos", style: textTheme.bodySmallMedium.copyWith(color: AppTheme.gray500)),
                  ],
                ),
              ],
            ),
          ),
          
          AppTheme.spacingWidget5,
          
          // Contenido Consejos
          SizedBox(
            height: screenW * 4/5,
            child: PageView(
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              physics: const BouncingScrollPhysics(),
              children: [
                for (List<Widget> children in childrens)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing5),
                    child: CardContentConsejo(children: children),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing5),
                  child: CardContentConsejo(
                    crossCenter: true,
                    children: [
                      // Encabezado
                      Text(
                        "¿Te gustó la información?",
                        style: textTheme.titleMedium,
                      ),
                      AppTheme.spacingWidget6,
                      Text(
                        "Refuerza lo aprendido con este rápido test y aumenta tus puntos para demostrar que eres la mejor mamá! 💕",
                        style: styleBodyPublicaciones,
                      ),
                      AppTheme.spacingWidget6,
                      ButtonPrimary(
                        "Hacer test",
                        iconRight: Icons.arrow_forward_ios,
                        size: 2,
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (BuildContext context) => const QuizzesScreen()
                            )
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          
          AppTheme.spacingWidget5,

          // Puntos de avance
          _PuntosAvanceConsejo(childrens: childrens)
        ],
      ),
    );
  }
}


// Widgets Internos
class _PuntosAvanceConsejo extends StatelessWidget {
  const _PuntosAvanceConsejo({
    required this.childrens,
  });

  final List<List<Widget>> childrens;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for(int i = 0; i < childrens.length; i++)
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: i == 0 ? AppTheme.primary500 : AppTheme.gray300
            ),
            height: 8,
            width: 8,
            margin: EdgeInsets.only(
              left: i == 0 ? 0 : AppTheme.spacing3
            ),
          )
      ],
    );
  }
}

class CardContentConsejo extends StatelessWidget {
  final List<Widget> children;
  final bool crossCenter;
  const CardContentConsejo({
    super.key, required this.children, this.crossCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppTheme.borderRadiusM,
        color: AppTheme.white
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacing5,
        vertical: AppTheme.spacing6
      ),
      child: Column(
        mainAxisAlignment: crossCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class CardPublicacion extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Widget child;
  const CardPublicacion({Key? key, required this.child, this.padding = const EdgeInsets.all(AppTheme.spacing5)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppTheme.borderRadiusL,
        color: AppTheme.gray100,
      ),
      child: Padding(
        padding: padding,
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
                Icon(Icons.emoji_events_outlined, size: 16, color: AppTheme.primary600,),
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

class CalloutContentConsejo extends StatelessWidget {
  final String text;
  const CalloutContentConsejo(this.text,{
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.primary50,
        borderRadius: AppTheme.borderRadiusS,
      ),
      padding: const EdgeInsets.all(AppTheme.spacing4),
      child: Text(text,
      style: styleBodyPublicaciones),
    );
  }
}