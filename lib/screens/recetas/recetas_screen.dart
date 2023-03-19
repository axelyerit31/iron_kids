import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iron_kids/screens/recetas/recetas_details.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/models/recetas.dart';
import 'package:iron_kids/styles/widgets.dart';
import 'package:iron_kids/styles/widgets/filter_chips.dart';

TextEditingController controllerBuscarReceta = TextEditingController();

bool _filterChipValue = true;

class RecetasScreen extends StatefulWidget {
  const RecetasScreen({Key? key}) : super(key: key);

  @override
  State<RecetasScreen> createState() => _RecetasScreenState();
}

class _RecetasScreenState extends State<RecetasScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //Spacing 20px
                AppTheme.spacingWidget10,

                //Titulo
                ScreenApp(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Recetas',
                        style: textTheme.headlineLarge,
                        
                      ),
                
                      //Spacing 20px
                      AppTheme.spacingWidget6,
                
                      // Buscador de recetas
                      const BuscaReceta(),
                    ],
                  ),
                ),

                //Botones filtros
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: <Widget>[
                      for (final filtro in _list)
                        Padding(
                          padding: const EdgeInsets.only(
                            left: AppTheme.spacing6,
                            right: AppTheme.spacing6,
                            top: AppTheme.spacing4,
                          ),
                          child: MyFilterChip(
                            selected: _filterChipValue,
                            onSelected: (value) {
                              setState(() {
                                _list.clear();
                              });
                            },
                            label: filtro.text,
                            closeMark: true,
                          ),
                        )
                    ],
                  ),
                ),
                
                AppTheme.spacingWidget6,

                //Recetas
                Center(
                  child: FutureBuilder<List<Receta>>(
                    future: RecetasService.obtenerRecetas(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {  
                        List<Receta>? recetas = [];
                        if(_list.isEmpty){
                          recetas = snapshot.data;
                        }else{
                          for (final receta in snapshot.data!){
                            if(receta.id == 1 || receta.id == 3) recetas.add(receta);
                          }
                        }
                        
                        return Wrap(
                          spacing: AppTheme.spacing6,
                          runSpacing: AppTheme.spacing6,
                          children: <Widget>[
                            for (final receta in recetas!)
                              CardRecetaLarge(
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (BuildContext context) => RecetasDetailsScreen(receta: receta)
                                    )
                                  );
                                },
                                linkImg: receta.imagen,
                                titulo: receta.titulo,
                                tiempo: receta.tiempo,
                                likes: receta.likes,
                                edad: receta.edad,
                                liked: receta.titulo.length < 18 ? false : true,
                              ) 
                          ]
                        );
                      }else if(snapshot.hasError){
                        return const Text('Error al cargar las recetas');
                      }  
                      return const CircularProgressIndicator();
                    }
                  ),
                )
              ]
            ),
          );
  }
}

/* Navigator(
      key: navigatorKeys[indexRecetasScreen],
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) {
          return 

        }
      )
    ); */

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
          Expanded(
            flex: 6,
            child: InputField(
              controller: controllerBuscarReceta,
              placeholder: "Buscar receta",
              iconLeft: Icons.search_rounded,
            )
          ),

          //Spacing 8px
          AppTheme.spacingWidget3,
          
          //Boton
          const ButtonPrimary('Filtrar', size: 2,)
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

class ListaRecetas extends StatefulWidget {
  const ListaRecetas({
    Key? key,
  }) : super(key: key);

  @override
  State<ListaRecetas> createState() => _ListaRecetasState();
}

class _ListaRecetasState extends State<ListaRecetas> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<Receta>>(
        future: RecetasService.obtenerRecetas(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {  
            List<Receta>? recetas = [];
            if(_list.isEmpty){
              recetas = snapshot.data;
            }else{
              for (final receta in snapshot.data!){
                if(receta.id == 1 || receta.id == 3) recetas.add(receta);
              }
            }
            
            return Wrap(
              spacing: AppTheme.spacing6,
              runSpacing: AppTheme.spacing6,
              children: <Widget>[
                for (final receta in recetas!)
                  CardRecetaLarge(
                    onPressed: (){
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (BuildContext context) => RecetasDetailsScreen(receta: receta)
                        )
                      );
                    },
                    linkImg: receta.imagen,
                    titulo: receta.titulo,
                    tiempo: receta.tiempo,
                    likes: receta.likes,
                    edad: receta.edad,
                    liked: receta.titulo.length < 18 ? false : true,
                  ) 
              ]
            );
          }else if(snapshot.hasError){
            return const Text('Error al cargar las recetas');
          }  
          return const CircularProgressIndicator();
        }
      ),
    );
  }
}

// Widget locals

// lista de filtros
class ListFilter extends StatefulWidget {
  final ValueChanged<bool>? onSelected;
  const ListFilter({super.key, this.onSelected});

  @override
  State<ListFilter> createState() => _ListFilterState();
}

class _ListFilterState extends State<ListFilter> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: <Widget>[
          for (final filtro in _list)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppTheme.spacing4, horizontal: AppTheme.spacing6),
              child: MyFilterChip(selected: _filterChipValue, onSelected: widget.onSelected, label: filtro.text, closeMark: true,),
            )
        ],
      ),
    );
  }
}

List<Filtros> _list = [
  Filtros(id: 0, color: AppTheme.primary50, text: 'Papa amarilla'),
];

class Filtros {
  final int id;
  final Color color;
  final String text;

  Filtros({required this.id, required this.color, required this.text});
}