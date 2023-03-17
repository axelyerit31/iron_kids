import 'package:flutter/material.dart';
import 'package:iron_kids/main.dart';
import 'package:iron_kids/models/recetas.dart';
import 'package:iron_kids/nav_bar_routes.dart';
import 'package:iron_kids/screens/mediafeed/mediafeed_publicaciones.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets.dart';

class MediaFeedScreen extends StatefulWidget {
  const MediaFeedScreen({Key? key}) : super(key: key);

  @override
  State<MediaFeedScreen> createState() => _MediaFeedScreenState();
}

class _MediaFeedScreenState extends State<MediaFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKeys[indexMediaFeedScreen],
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) {
          return Scaffold(
          appBar: AppBar(
            shadowColor: AppTheme.gray50,
            elevation: 3,
            backgroundColor: AppTheme.white,
            toolbarHeight: screenH * 1 / 12,
            title: Text(
              "Niños de Hierro",
              style: textTheme.headlineLarge!.copyWith(color: AppTheme.gray800),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: AppTheme.spacing4),
                child: Material(
                  elevation: 0,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  color: Colors.transparent,
                  child: Ink.image(
                    image: const NetworkImage('https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/Profile%2Fphoto_lupe.png?alt=media&token=b6be5f56-41e7-47a2-b240-97a9c3131690'),
                    width: 50,
                    height: 50,
                    child: InkWell(
                      onTap: () {
                        // Yendo a la pantalla PerfilMadre
                        selectedIndexGlobal.value = indexPerfilMadreScreen;
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(children: [
                  //Spacing 20px
                  AppTheme.spacingWidget6,
        
                  // Tarjeta control de anemia
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppTheme.spacing6),
                      child: _ControlAnemiaSection()),
        
                  // Spacing 20px
                  AppTheme.spacingWidget5,
        
                  // Recomendados
                  const _RecomendadosSection(),
        
                  // Spacing 20px
                  AppTheme.spacingWidget6,
        
                  // Publicaciones
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppTheme.spacing6),
                    child: _PublicacionesSection(),
                  )
                ]
              ),
            ),
          );
        }
      )
    );
  }
}

// Secciones
class _PublicacionesSection extends StatelessWidget {

  const _PublicacionesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // Titulo
        Text("Publicaciones", style: textTheme.headlineSmall),

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
                  style: textTheme.labelLarge!.copyWith(color: AppTheme.gray700),
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

        // Publicaciones
        ListView.builder(
          shrinkWrap: true, // Solucion para que el listview se ajuste a su contenido
          physics: const NeverScrollableScrollPhysics(), // Deshabilita el scroll del listview
          itemCount: publicacionesLista.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: AppTheme.spacing5),
              child: publicacionesLista[index],
            );
          },
        ),

      ],
    );
  }
}

class _ControlAnemiaSection extends StatelessWidget {
  const _ControlAnemiaSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.gray100,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: AppTheme.borderRadiusL),
      child: InkWell(
        borderRadius: AppTheme.borderRadiusL,
        onTap: () {
          // SYendo a la pantalla ControlAnemia
          selectedIndexGlobal.value = indexControlAnemiaScreen;
        },
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacing6),
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
              ButtonIcon(
                onPressed: () {
                  // Yendo a la pantalla ControlAnemia
                  selectedIndexGlobal.value = indexControlAnemiaScreen;
                },
                icon: Icons.arrow_forward_ios,
                size: 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _RecomendadosSection extends StatelessWidget {
  const _RecomendadosSection({
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
              SizedBox(
                height: 35,
                child: ButtonText(
                  "Ver más",
                  onPressed: () {
                    // Yendo a la pantalla ControlAnemia
                    selectedIndexGlobal.value = indexRecetasScreen;
                  },
                ),
              ),
            ],
          ),
        ),

        // Spacing 12px
        AppTheme.spacingWidget4,

        // Carrusel de recetas recomendadas
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: FutureBuilder<List<Receta>>(
            future: RecetasService.obtenerRecetas(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final recetas = snapshot.data;
                return Row(
                  children: [
                    for (final receta in recetas!)
                      Padding(
                        padding: EdgeInsets.only(
                            left: receta.id == 0
                                ? AppTheme.spacing6
                                : AppTheme.spacing4),
                        child: CardRecetaSmall(
                          linkImg: receta.imagen,
                          titulo: receta.titulo,
                          tiempo: receta.tiempo,
                          likes: receta.likes,
                          edad: receta.edad,
                        ),
                      )
                  ],
                );
              } else if (snapshot.hasError) {
                return const Text('Error al cargar las recetas');
              }
              return const CircularProgressIndicator();
            },
          )
        ),
      ],
    );
  }
}
