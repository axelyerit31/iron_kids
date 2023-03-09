import 'package:flutter/material.dart';
import 'package:iron_kids/main.dart';
import 'package:iron_kids/styles/widgets/header.dart';

class QuizzesScreen extends StatelessWidget {
  const QuizzesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: screenH * 1 / 12,
        title: const Header(
          title: 'Niños de Hierro',
        ),
      ),
      body: const SingleChildScrollView(),
    );
  }
}
