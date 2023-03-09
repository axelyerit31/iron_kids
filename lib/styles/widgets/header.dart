import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';

class Header extends StatelessWidget {
  final String title;
  const Header({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTheme.headlineLarge(context),
        ),
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
              image: DecorationImage(
                image: NetworkImage('https://via.placeholder.com/50x50'),
                fit: BoxFit.cover,
              )),
        ),
      ],
    );
  }
}
