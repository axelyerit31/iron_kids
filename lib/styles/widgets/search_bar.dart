import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 45.0,
      width: 260,
      decoration: BoxDecoration(
        color: AppTheme.gray50,
        borderRadius: AppTheme.borderRadiusL,
        border:Border.all(color: AppTheme.gray300, width: AppTheme.borderS)
      ),
      child: TextField(
        style: textTheme.bodyMedium,
        cursorColor: AppTheme.gray500,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.search
          ),
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Colors.grey,
       ),
        hintText: 'Busca receta'
        )
      )
    );
  }
}
