import 'package:flutter/material.dart';
import 'package:iron_kids/nav_bar_routes.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/models/recetas.dart';
import 'package:iron_kids/styles/widgets.dart';


class RecetasScreen extends StatelessWidget {
  const RecetasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenApp(
      child:SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Spacing 20px
            AppTheme.spacingWidget10,

            //Titulo
            Text('Recetas',
              style: textTheme.headlineMedium!.copyWith(color: AppTheme.gray800),
              
            ),

            //Spacing 20px
            AppTheme.spacingWidget6,

            // Buscador de recetas
            const BuscaReceta(),
            

          //Spacing 20px
          AppTheme.spacingWidget6,

          //Botones filtros
          const ListFilter(),

          //Spacing 20px
          AppTheme.spacingWidget6,

          //Recetas
          const ListaRecetas()
        ]
      ),
    );
  }
}

//Estructura
class BuscaReceta extends StatelessWidget {
  const BuscaReceta({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: screenW,
    
      child: Row(
        children: [

          //Buscador
          const Expanded(
            flex: 6,
            child:SearchBar()
            ),

          //Spacing 8px
          AppTheme.spacingWidget3,
          
          //Boton
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(84, 45)),
              backgroundColor: MaterialStateProperty.all(AppTheme.primary500),
              //elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: AppTheme.borderRadiusS,
                ),
              ),
            ),
            child: Text(
              'Filtrar',
              style: TextStyle(color: AppTheme.primary50),
            ),
          ),
        ],
      ),
    );
  }
}

class BotonsFilter extends StatelessWidget {
  const BotonsFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: ListFilter(),


    );
  }
}

class ListaRecetas extends StatelessWidget {
  const ListaRecetas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Receta>>(
        future: RecetasService.obtenerRecetas(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {  
            final recetas = snapshot.data;
            return Wrap(
              children: <Widget>[
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
              ]
            );
          }else if(snapshot.hasError){
            return const Text('Error al cargar las recetas');
          }  
          return const CircularProgressIndicator();
        }
      )
    );
  }
}

// Widget locals

// lista de filtros
class ListFilter extends StatelessWidget {
  const ListFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        for (final filtro in _list)
          SizedBox(
            // padding: const EdgeInsets.all(AppTheme.spacing4),
            width: 84,
            height: 36,
            child: ButtonSecondary(filtro.text,
              size: 1,

            )
           /*  ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(filtro.color),
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: AppTheme.borderRadiusM,
                  ),
                ),
              ),
              child: Text(filtro.text)  
            ), */
          )
      ],
    );
  }
}

List<Filtros> _list = [
  Filtros(id: 0, color: AppTheme.primary50, text: 'recomendado'),
  Filtros(id: 1, color: AppTheme.gray100, text: 'todo'),
  Filtros(id: 2, color: AppTheme.gray100, text: 'costa'),
  Filtros(id: 3, color: AppTheme.gray100, text: 'sierra'),
  Filtros(id: 4, color: AppTheme.gray100, text: 'selva')
];

class Filtros {
  final int id;
  final Color color;
  final String text;

  Filtros({required this.id, required this.color, required this.text});

  // factory Filtros.fromJson(Map<String, dynamic> json) {
  //   return Filtros(
  //     id: json['id'],
  //     color: json['color'],
  //     text: json['text']
  //   );
  // }
}

