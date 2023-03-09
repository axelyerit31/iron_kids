import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class Receta {
  final int id;
  final String titulo;
  final String imagen;
  final String tiempo;
  final String likes;
  final String edad;
  final List<dynamic> ingredientes;
  final List<dynamic> pasos;

  Receta({required this.id, required this.titulo, required this.imagen, required this.tiempo, required this.likes, required this.edad, required this.ingredientes, required this.pasos});

  factory Receta.fromJson(Map<String, dynamic> json) {
    return Receta(
      id: json['id'],
      titulo: json['titulo'],
      imagen: json['imagen'],
      tiempo: json['tiempo'],
      likes: json['likes'],
      edad: json['edad'],
      ingredientes: json['ingredientes'],
      pasos: json['pasos'],
    );
  }
}

class RecetasService {
  static Future<List<Receta>> obtenerRecetas() async {
    String jsonString = await rootBundle.loadString('assets/data/recetas.json');
    List<dynamic> jsonList = json.decode(jsonString);
    List<Receta> recetas = jsonList.map((json) => Receta.fromJson(json)).toList();
    return recetas;
  }
}