import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20.0),
          const CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('assets/images/profile_image.jpg'),
          ),
          const SizedBox(height: 20.0),
          const Text(
            'Nombre de usuario',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            'Descripción de usuario',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Siguiendo',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  const Text(
                    '100',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Seguidores',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  const Text(
                    '200',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Editar Perfil'),
          ),
        ],
      ),
    );
  }
}