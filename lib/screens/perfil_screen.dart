import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/models/recetas.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/styles/widgets.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recetas',
          style: textTheme.headlineLarge,
        ),
      ),
      body: SingleChildScrollView(
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
           Container(
            color: AppTheme.gray800 ,
            height: 100,
            width: 100,
          ),
       

          //Spacing 20px
          AppTheme.spacingWidget6,

          //Recetas
          const ListaRecetas()
        ]),
      ),
      bottomNavigationBar: Row(),
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
            child: 
              Text('Filtrar', 
                style: TextStyle(
                  color:AppTheme.primary50
                ) ,
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
