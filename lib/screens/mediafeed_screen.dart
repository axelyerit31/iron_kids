import 'package:flutter/material.dart';
import 'package:iron_kids/main.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets.dart';

import '../styles/widgets/buttons.dart';

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
          toolbarHeight: screenH * 1 / 12,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Niños de Hierro',
                style: textTheme.headlineLarge,
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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            //Spacing 20px
            AppTheme.spacingWidget6,

            // Tarjeta control de anemia
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppTheme.spacing6),
              child: ControlAnemiaSection(),
            ),

            // Spacing 20px
            AppTheme.spacingWidget6,

            // Recomendados
            const RecomendadosSection(),

            // Spacing 20px
            AppTheme.spacingWidget6,

            // Publicaciones
            const PublicacionesSection()
          ]),
        ));
  }
}

// Secciones
class PublicacionesSection extends StatelessWidget {
  const PublicacionesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titulo
          Text("Publicaciones", style: AppTheme.headlineSmall(context)),

          AppTheme.spacingWidget5,

          // Campo de texto para publicacion
          Container(
            height: screenH * 1 / 8,
            decoration: BoxDecoration(
              borderRadius: AppTheme.borderRadiusL,
              border: Border.all(color: AppTheme.gray300),
            ),
            padding: const EdgeInsets.symmetric(
                vertical: AppTheme.spacing2, horizontal: AppTheme.spacing5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: 'Escribe algo...',
                      border: InputBorder.none,
                      hintStyle: textTheme.labelLarge,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: AppTheme.borderRadiusXL,
                      ),
                    ),
                  ),
                  child: const Text('Publicar'),
                ),
              ],
            ),
          ),

          AppTheme.spacingWidget5,

          // Primera publicacion
          Container(
            decoration: BoxDecoration(
              borderRadius: AppTheme.borderRadiusL,
              color: AppTheme.gray100,
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppTheme.spacing5),
              child: Column(
                children: [
                  // Datos de usuario
                  Row(
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
                            children: [
                              Text(
                                'Daniela Flores',
                                style: AppTheme.bodyMediumSemiBold(context),
                              ),
                              AppTheme.spacingWidget2,
                              const Text('·'),
                              AppTheme.spacingWidget2,
                              Text(
                                'hace 1 día',
                                style: AppTheme.bodySmall(context)
                                    .copyWith(color: AppTheme.gray500),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.emoji_events,
                                size: 16,
                                color: AppTheme.primary600,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '120 puntos',
                                style: AppTheme.bodySmallMedium(context)
                                    .copyWith(color: AppTheme.primary600),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Contenido vencedor
                  Card(
                    elevation: 0,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Daniela Ramos'),
                                SizedBox(height: 8),
                                Text('¡Ha logrado vencer la anemia!'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Text('Texto de publicación'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ControlAnemiaSection extends StatelessWidget {
  const ControlAnemiaSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    child: Text(
                      'Lleva un control de la anemia y registra citas pasadas o futuras.',
                      style: textTheme.bodySmall,
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
    );
  }
}

class RecomendadosSection extends StatelessWidget {
  const RecomendadosSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Recomendados y Ver mas
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Recomendados',
                style: textTheme.headlineSmall,
              ),
              const ButtonText("Ver más"),
            ],
          ),
        ),

        // Spacing 12px
        AppTheme.spacingWidget4,

        // Carrusel de recetas recomendadas
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(5, (index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: index == 0 ? AppTheme.spacing6 : AppTheme.spacing4),
                child: const CardRecetaSmall(
                  titulo: "Chaufa de Sangrecita",
                  tiempoCocina: "12 min",
                  likes: 124,
                  edad: "12 a 23 meses",
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
