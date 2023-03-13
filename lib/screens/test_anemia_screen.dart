import 'package:flutter/material.dart';
import 'package:iron_kids/styles/widgets/filter_chips.dart';

class TestAnemiaScreen extends StatefulWidget {
  const TestAnemiaScreen({super.key});

  @override
  State<TestAnemiaScreen> createState() => _TestAnemiaScreenState();
}

class _TestAnemiaScreenState extends State<TestAnemiaScreen> {

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {Navigator.of(context).pushNamed("/login");},
              child: const Text('Ir a Login'),
            ),
            ElevatedButton(
              onPressed: () {Navigator.of(context).pushNamed("/quizzes");},
              child: const Text('Ir a quizzes'),
            ),
            ElevatedButton(
              onPressed: () {Navigator.of(context).pushNamed("/botonesMuestra");},
              child: const Text('Ir a muestra de botones'),
            ),
            MyFilterChip(
              selected: isSelected,
              onSelected: (value) {
                setState(() {
                  isSelected = value;
                });
              },
              label: "Chip 1"
            )
          ],
        ),
      );
  }
}