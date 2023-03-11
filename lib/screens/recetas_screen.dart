import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/models/recetas.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets.dart';

class RecetasScreen extends StatelessWidget {
  const RecetasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Spacing 20px
          AppTheme.spacingWidget6,

          // Buscador de recetas
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppTheme.spacing6),
            child: BuscaReceta(),
          ),

          //Spacing 20px
          AppTheme.spacingWidget6,

          //Botones filtros
          ListFilter(),

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
    return Container(
      child: Row(
        children: [
          //Buscador
          const SearchBar(),

          AppTheme.spacingWidget6,

          //Boton
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(Size(84, 45)),
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
    return const ListFilter();
  }
}

class ListaRecetas extends StatelessWidget {
  const ListaRecetas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row();
  }
}

// Widget locals

class ListFilter extends StatelessWidget {
  const ListFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final filtro in _list)
          Container(
            padding: const EdgeInsets.all(AppTheme.spacing4),
            width: 84,
            height: 36,
            child: ElevatedButton(
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
                child: Text(filtro.text)),
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

@override
Widget build(BuildContext context) {
  return Container();
}
