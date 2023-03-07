import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Column(
        children: [
          const Text("Hola, Lupe uwu :3",
              style: TextStyle(color: Color(0xff475068))),
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Woman_1.jpg/768px-Woman_1.jpg"),
              ),
              Container(
                child: Container(
                  child: Column(
                    children: const [Text("Niños")],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
