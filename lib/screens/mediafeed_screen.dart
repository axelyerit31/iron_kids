import 'package:flutter/material.dart';
import 'package:iron_kids/main.dart';
import 'package:iron_kids/styles/appTheme.dart';

class MediaFeedScreen extends StatefulWidget {
  const MediaFeedScreen({Key? key}) : super(key: key);

  @override
  State<MediaFeedScreen> createState() => _MediaFeedScreenState();
}

class _MediaFeedScreenState extends State<MediaFeedScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: screenH * 1/12,
        title: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Niños de Hierro',
              style: AppTheme.headlineLarge(context),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  image: DecorationImage(
                    image: NetworkImage('https://via.placeholder.com/50x50'),
                    fit: BoxFit.cover,
                  )),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing6),
        child: Column(children: [
          
          //Spacing 20px
          AppTheme.spacingWidget6,

          // Tarjeta control de anemia
          Card(
            color: AppTheme.gray100,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: AppTheme.borderRadiusL),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Control de Anemia',
                          style: AppTheme.titleMedium(context),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          child: Text(
                            'Lleva un control de la anemia y registra citas pasadas o futuras.',
                            style: AppTheme.bodySmall(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: const Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Spacing 20px
          AppTheme.spacingWidget6,

          // Recomendados
          Column(
            children: [

              // Recomendados y Ver mas
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Recomendados',
                    style: AppTheme.headlineSmall(context),
                  ),
                  Text(
                    'Ver más',
                    style: AppTheme.labelLarge(context),
                  ),
                ],
              ),

              // Spacing 12px
              AppTheme.spacingWidget4,
          
              // Carrusel de recetas recomendadas
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(5, (index) {
                    return SizedBox(
                      height: screenW * 1/3 * 3/2,
                      width: screenW * 1/3,
                      child: Card(
                        color: AppTheme.gray100,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: AppTheme.borderRadiusL),
                        margin: const EdgeInsets.only(
                          right: 10
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
                                  padding: const EdgeInsets.all(AppTheme.spacing3),
                                  child: Text(
                                    'Chaufa con Sangrecita',
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
                                          Text('12 min', style: AppTheme.bodySmallMedium(context).copyWith(color: AppTheme.gray500)),
                                        ],
                                      ),
                                      
                                      
                                      const SizedBox(height: 8),
                                      
                                      // Likes
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.thumb_up_outlined, color: AppTheme.gray500),
                                          const SizedBox(width: 4),
                                          Text('128', style: AppTheme.bodySmallMedium(context).copyWith(color: AppTheme.gray500)),
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
                                      Text('12 a 23 meses', style: AppTheme.bodySmallMedium(context).copyWith(color: AppTheme.gray500)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        
        ]),
      )
    );
  }
}


/* Gpt, dame el codigo para un diseño en flutter, los estilos son extraidos del widget: Theme.of(context).textTheme.

fila (con for de 5 para mostrar 5 veces el card de debajo)
  card
    column
      container con bordes redondeado en 16 px, (imagen en decoration)
        "Chaufa con Sangrecita", ubicado con Alignment.end
      Columna
        Fila
          Fila (Con mainaxissize min)
            Icono tiempo
            "12 min"
          Fila (Con mainaxissize min)
            Icono like
            "128"
          Fila (Con mainaxissize min)
            Icono bebe
            "12 a 23 meses"
          


*/
