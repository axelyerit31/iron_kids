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
    return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            //Spacing 20px
            AppTheme.spacingWidget6,

            // Tarjeta control de anemia
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: AppTheme.spacing6),
                child: ControlAnemiaSection()),

            // Spacing 20px
            AppTheme.spacingWidget5,

            // Recomendados
            const RecomendadosSection(),

            // Spacing 20px
            AppTheme.spacingWidget6,

            // Publicaciones
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing6),
              child: PublicacionesSection(),
            )
          ]),
        );
  }
}

// Secciones
class PublicacionesSection extends StatelessWidget {

  PublicacionesSection({
    Key? key,
  }) : super(key: key);

  final List<Widget> publicacionesLista = [

    const PublicacionVencedores(usuarioLinkImg: "https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/Profile%2Fphoto_daniela_flores.png?alt=media&token=4ffeb2b6-3b4e-401c-b2f9-f6f41236387b", usuario: "Daniela Flores", fecha: "hace 1 día", puntos: "120 puntos", hijo: "Daniela Ramos", hijoLinkImg: "https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/AvatarChild%2Fgirl_avatar_2.png?alt=media&token=8f716cc4-93c4-4d80-8ba1-9c984cd454e9", body: "Quiero compartir con todos que mi hija finalmente venció la anemia 🥳🎊 Ha sido un camino difícil para ella y nuestra familia, pero estamos tan agradecidos de que finalmente esté en plena salud. Gracias a todos los que nos apoyaron en este camino 🙏"),

    const PublicacionExperiencias(usuarioLinkImg: "https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/Profile%2Fphoto_lupe.png?alt=media&token=b6be5f56-41e7-47a2-b240-97a9c3131690", usuario: "Lupe Batallán", fecha: "hace 1 día", puntos: "230 puntos", recetaTitulo: "Chaufa de Sangrecita", recetaLinkImg: "https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/Recetas%2Fchaufa_sangrecita.png?alt=media&token=b983eb50-fcc3-46d8-a09b-a4220f858f77", body: "Hace unos meses, mi hijo de 1 año tuvo una deficiencia de hemoglobina y su médico recomendó una dieta rica en hierro. Sabía que la sangrecita es una gran fuente de hierro, y en esta receta me encantó!! 😍"),

    const PublicacionNoticias(fecha: "hace 3 días", noticiaLinkImg: "https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/Noticias%2Fnoticia.png?alt=media&token=76cbbeef-ccd0-45e3-b79e-9ddef2dca32c", noticiaFecha: "18 Feb 2023 | 13:58 h", noticiaTitulo: "Fortalecen estrategias para la lucha contra la anemia infantil en Ayacucho", noticiaBody: "En el marco de lucha contra la anemia y la búsqueda de la reducción de sus niveles en el ámbito nacional, la Fundación contra el Hambre (FH Perú) celebró alianzas con la Dirección Regional de Salud de Ayacucho (DIRESA), la Red de Salud Huamanga.", noticiaLink: "")

  ];

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
              padding: const EdgeInsets.only(bottom: AppTheme.spacing4),
              child: publicacionesLista[index],
            );
          },
        ),

      ],
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
              const SizedBox(
                height: 35,
                child: ButtonText(
                  "Ver más",
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
            )),
      ],
    );
  }
}
