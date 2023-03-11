import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class Quizz {
  final int id;
  final String question;
  final List<dynamic> options;
  final int index;

  Quizz({
    required this.id,
    required this.question,
    required this.options,
    required this.index,
  });

  factory Quizz.fromJson(Map<String, dynamic> json) {
    return Quizz(
      id: json['id'],
      question: json['question'],
      options: json['options'],
      index: json['index'],
    );
  }
}

class QuizzService {
  static Future<List<Quizz>> getQuizz() async {
    String jsonString =
        await rootBundle.loadString('assets/data/questions.json');
    List<dynamic> jsonList = json.decode(jsonString);
    List<Quizz> questions =
        jsonList.map((json) => Quizz.fromJson(json)).toList();
    return questions;
  }
}
