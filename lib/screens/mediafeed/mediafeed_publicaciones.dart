import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets/publicaciones_widgets.dart';

final List<Widget> publicacionesLista = [

  const PublicacionVencedores(usuarioLinkImg: "https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/Profile%2Fphoto_daniela_flores.png?alt=media&token=4ffeb2b6-3b4e-401c-b2f9-f6f41236387b", usuario: "Daniela Flores", fecha: "hace 1 día", puntos: "120 puntos", hijo: "Daniela Ramos", hijoLinkImg: "https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/AvatarChild%2Fgirl_avatar_2.png?alt=media&token=8f716cc4-93c4-4d80-8ba1-9c984cd454e9", body: "Quiero compartir con todos que mi hija finalmente venció la anemia 🥳🎊 Ha sido un camino difícil para ella y nuestra familia, pero estamos tan agradecidos de que finalmente esté en plena salud. Gracias a todos los que nos apoyaron en este camino 🙏"),

  const PublicacionExperiencias(usuarioLinkImg: "https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/Profile%2Fphoto_lupe.png?alt=media&token=b6be5f56-41e7-47a2-b240-97a9c3131690", usuario: "Lupe Batallán", fecha: "hace 1 día", puntos: "20 puntos", recetaTitulo: "Chaufa de Sangrecita", recetaLinkImg: "https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/Recetas%2Fchaufa_sangrecita.png?alt=media&token=56c3c761-0ac8-4b6d-96b6-3a0241813ba9", body: "Hace unos meses, mi hijo de 1 año tuvo una deficiencia de hemoglobina y su médico recomendó una dieta rica en hierro. Sabía que la sangrecita es una gran fuente de hierro, y en esta receta me encantó!! 😍"),

  const PublicacionNoticias(fecha: "hace 3 días", noticiaLinkImg: "https://firebasestorage.googleapis.com/v0/b/iron-kids-app.appspot.com/o/Noticias%2Fnoticia.png?alt=media&token=76cbbeef-ccd0-45e3-b79e-9ddef2dca32c", noticiaFecha: "18 Feb 2023 | 13:58 h", noticiaTitulo: "Fortalecen estrategias para la lucha contra la anemia infantil en Ayacucho", noticiaBody: "En el marco de lucha contra la anemia y la búsqueda de la reducción de sus niveles en el ámbito nacional, la Fundación contra el Hambre (FH Perú) celebró alianzas con la Dirección Regional de Salud de Ayacucho (DIRESA), la Red de Salud Huamanga.", noticiaLink: ""),

  PublicacionConsejos(
    fecha: "hace 3 días",
    childrens: [
      
      // Page 1
      [
        Text("Hierro: el superhéroe de la salud de tus hijos", style: textTheme.headlineMedium,),
        AppTheme.spacingWidget5,
        Text("La anemia es una afección común en los niños, especialmente en aquellos que tienen una dieta pobre en hierro. Para prevenirla, es importante que conozcamos los alimentos que son ricos en hierro y lo incluyamos en la dieta de los niños.\n\nEs por eso que conoceremos por qué es tan importante, que alimentos son ricos en hierro, como mejorar la aborción de éste y otras formas de obtenerlo.",
        style: styleBodyPublicaciones),
      ],

      // Page 2
      [
        Text("Importancia del hierro en la dieta infantil", style: textTheme.titleMedium,),
        
        AppTheme.spacingWidget5,

        Text("El hierro es un nutriente esencial para la salud de los niños, ya que juega un papel clave en el transporte de oxígeno por todo el cuerpo y en el desarrollo cognitivo.",
        style: styleBodyPublicaciones),

        AppTheme.spacingWidget5,

        // Callout
        const CalloutContentConsejo("El hierro ayuda en la producción de hemoglobina y prevención de la anemia."),
        
        AppTheme.spacingWidget5,

        Text("Una deficiencia de hierro puede afectar el crecimiento, el sistema inmunológico y el desarrollo del cerebro de los niños.",
        style: styleBodyPublicaciones),
      ],

      // Page 3
      [
        // Encabezado
        Text("Alimentos ricos en hierro", style: textTheme.titleMedium,),
        
        AppTheme.spacingWidget5,

        Text("Es importante que los niños consuman alimentos ricos en hierro para asegurarse de que reciban suficiente de este nutriente.",
        style: styleBodyPublicaciones),
        
        AppTheme.spacingWidget5,

        const CalloutContentConsejo("Los niños en crecimiento necesitan más hierro que los adultos."),
        
        AppTheme.spacingWidget5,

        Text("Las fuentes alimentarias de hierro incluyen carnes rojas, aves de corral, pescado, legumbres, frutas secas y verduras de hojas verdes. Además el hierro de origen animal se absorbe mejor que el de origen vegetal.",
        style: styleBodyPublicaciones),
      ],

      // Page 4
      [
        // Encabezado
        Text("Alimentos que mejoran la absorción del hierro", style: textTheme.titleMedium,),
        
        AppTheme.spacingWidget5,

        Text("Los alimentos ricos en vitamina C, como las naranjas, los kiwis y los pimientos, pueden aumentar la absorción de hierro de los alimentos vegetales. Además, la carne, el pescado y las aves de corral también pueden mejorar la absorción del hierro de otros alimentos.",
        style: styleBodyPublicaciones),
        
        AppTheme.spacingWidget5,

        const CalloutContentConsejo("El té y el café deben evitarse durante las comidas para mejorar la absorción del hierro."),
      ],

      // Page 5
      [
        // Encabezado
        Text("Suplementos de hierro", style: textTheme.titleMedium,),
        
        AppTheme.spacingWidget5,

        Text("En algunos casos, puede ser necesario tomar suplementos de hierro para prevenir o tratar la deficiencia de hierro en los niños.",
        style: styleBodyPublicaciones),
        
        AppTheme.spacingWidget5,

        const CalloutContentConsejo("Siempre es importante consultar con un profesional de la salud antes de comenzar a tomar cualquier suplemento."),
        
        AppTheme.spacingWidget5,

        Text("Esto debe ser visto como una oportunidad para mejorar la ingesta de hierro y otros nutrientes importantes, y no como una tarea difícil o tediosa.",
        style: styleBodyPublicaciones),
      ],
    ]
  )

];

