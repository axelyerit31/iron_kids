import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class Receta {
  final int id;
  final String titulo;
  final String imagen;
  final String imagenXL;
  final String tiempo;
  final String likes;
  final bool liked;
  final String region;
  final String edad;
  final List<dynamic> ingredientes;
  final List<dynamic> pasos;

  Receta({
    required this.id,
    required this.titulo,
    required this.imagen,
    required this.imagenXL,
    required this.tiempo,
    required this.likes,
    required this.liked,
    required this.region,
    required this.edad,
    required this.ingredientes,
    required this.pasos,
  });

  factory Receta.fromJson(Map<String, dynamic> json) {
    return Receta(
      id: json['id'],
      titulo: json['titulo'],
      imagen: json['imagen'],
      imagenXL: json['imagenXL'],
      tiempo: json['tiempo'],
      likes: json['likes'],
      liked: json['liked'],
      region: json['region'],
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
    List<Receta> recetas =
        jsonList.map((json) => Receta.fromJson(json)).toList();
    return recetas;
  }
}
