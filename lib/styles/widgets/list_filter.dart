import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';
import 'package:iron_kids/models/filtros.dart';



class ListFilter extends StatelessWidget {
  const ListFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: _list.length,
        padding: const EdgeInsets.only(
            left: AppTheme.spacing6, right: AppTheme.spacing6),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(AppTheme.spacing4),
            width: 74,
            height: 36,
            child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(_list[index].color),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: AppTheme.borderRadiusM,
                    ),
                  ),
                ),
                child: Text(_list[index].text)),
          );
        },
      ),
    );
  }
}

List<Filtros>_list = [
  Filtros(
    id: 0, 
    color: AppTheme.primary50,
    text: 'recomendado'
  ),
  Filtros(
    id: 1, 
    color: AppTheme.gray100,
    text: 'todo'
  ),
  Filtros(
    id: 2, 
    color: AppTheme.gray100,
    text: 'costa'
  ),
   Filtros(
    id: 3, 
    color: AppTheme.gray100,
    text: 'sierra'
  ),
   Filtros(
    id:4, 
    color: AppTheme.gray100,
    text: 'selva'
  )
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