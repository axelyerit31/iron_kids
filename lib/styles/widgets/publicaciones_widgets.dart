import 'package:flutter/material.dart';
import 'package:iron_kids/main.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets/buttons.dart';

TextStyle _styleBodyPublicaciones = textTheme.bodyMedium!.copyWith(height: 1.35);

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
          
          Text(body, style: _styleBodyPublicaciones),
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
          
          Text(body, style: _styleBodyPublicaciones),
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

              Text(noticiaBody, style: _styleBodyPublicaciones),
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
  final int pages;
  
  const PublicacionConsejos({Key? key, required this.fecha, required this.pages, }) : super(key: key);

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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                AppTheme.spacingWidget6,

                // Card 1
                CardContentConsejo(
                  children: [
                    Text("Hierro: el superhéroe de la salud de tus hijos", style: textTheme.headlineMedium,),
                    AppTheme.spacingWidget5,
                    Text("La anemia es una afección común en los niños, especialmente en aquellos que tienen una dieta pobre en hierro. Para prevenirla, es importante que conozcamos los alimentos que son ricos en hierro y lo incluyamos en la dieta de los niños.\n\nEs por eso que conoceremos por qué es tan importante, que alimentos son ricos en hierro, como mejorar la aborción de éste y otras formas de obtenerlo.",
                    style: _styleBodyPublicaciones),
                  ],
                ),
          
                AppTheme.spacingWidget5,
          
                // Card 2
                CardContentConsejo(
                  children: [
                    Text("Importancia del hierro en la dieta infantil", style: textTheme.titleSmall,),
                    AppTheme.spacingWidget5,

                    Text("El hierro es un nutriente esencial para la salud de los niños, ya que juega un papel clave en el transporte de oxígeno por todo el cuerpo y en el desarrollo cognitivo.",
                    style: _styleBodyPublicaciones),
                    AppTheme.spacingWidget5,

                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.primary50,
                        borderRadius: AppTheme.borderRadiusS,
                      ),
                      padding: const EdgeInsets.all(AppTheme.spacing4),
                      child: Text("El hierro ayuda en la producción de hemoglobina y prevención de la anemia.",
                      style: _styleBodyPublicaciones),
                    ),
                    AppTheme.spacingWidget5,

                    Text("Una deficiencia de hierro puede afectar el crecimiento, el sistema inmunológico y el desarrollo del cerebro de los niños.",
                    style: _styleBodyPublicaciones),
                  ],
                ),
              ],
            ),
          ),
          
          AppTheme.spacingWidget5,

          // Puntos de avance
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(int i = 0; i < pages; i++)
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
          )
        ],
      ),
    );
  }
}

class CardContentConsejo extends StatelessWidget {
  final List<Widget> children;
  const CardContentConsejo({
    super.key, required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenW * 4/5 - 10,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: AppTheme.borderRadiusM,
            color: AppTheme.white
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacing5,
            vertical: AppTheme.spacing6
          ),
          child: Column(
            children: children,
          ),
        ),
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
