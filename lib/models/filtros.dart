import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:iron_kids/styles/app_theme.dart';

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
// class RecetasService {
//   static Future<List<Filtros>> obtenerFiltros() async {
//     String jsonString = await rootBundle.loadString('assets/data/filtros.json');
//     List<dynamic> jsonList = json.decode(jsonString);
//     List<Filtros> filtros = jsonList.map((json) => Filtros.fromJson(json)).toList();
//     return filtros;
//   }
// }