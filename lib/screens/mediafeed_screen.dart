import 'package:flutter/material.dart';
import 'package:iron_kids/main.dart';
import 'package:iron_kids/models/recetas.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets.dart';
import 'package:iron_kids/styles/widgets/publicaciones_widgets.dart';


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
          const PublicacionVencedores(usuario: "Daniela Flores", fecha: "hace 1 día", puntos: "120 puntos", hijo: "Daniela Ramos", body: "Quiero compartir con todos que mi hija finalmente venció la anemia 🥳🎊 Ha sido un camino difícil para ella y nuestra familia, pero estamos tan agradecidos de que finalmente esté en plena salud. Gracias a todos los que nos apoyaron en este camino 🙏"),

          AppTheme.spacingWidget5,

          const PublicacionExperiencias(usuario: "Lupe Batallán", fecha: "hace 1 día", puntos: "230 puntos", tituloReceta: "Chaufa de Sangrecita", linkRecetaImg: "", body: "Hace unos meses, mi hijo de 1 año tuvo una deficiencia de hemoglobina y su médico recomendó una dieta rica en hierro. Sabía que la sangrecita es una gran fuente de hierro, y en esta receta me encantó!! 😍"),

          AppTheme.spacingWidget5,

          const PublicacionNoticias(fecha: "hace 3 días", linkNoticiaImg: "", fechaNoticia: "18 Feb 2023 | 13:58 h", tituloNoticia: "Fortalecen estrategias para la lucha contra la anemia infantil en Ayacucho", bodyNoticia: "En el marco de lucha contra la anemia y la búsqueda de la reducción de sus niveles en el ámbito nacional, la Fundación contra el Hambre (FH Perú) celebró alianzas con la Dirección Regional de Salud de Ayacucho (DIRESA), la Red de Salud Huamanga.", linkNoticia: "")

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
          child: FutureBuilder<List<Receta>>(
            future: RecetasService.obtenerRecetas(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final recetas = snapshot.data;
                return Row(
                  children: [
                    for (final receta in recetas!)
                      Padding(
                        padding: EdgeInsets.only(left: receta.id == 0 ? AppTheme.spacing6 : AppTheme.spacing4),
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
