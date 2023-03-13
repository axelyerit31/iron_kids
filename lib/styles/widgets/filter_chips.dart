import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';

class MyFilterChip extends StatelessWidget {
  final bool selected;
  final ValueChanged<bool>? onSelected;
  final String label;
  final bool checkMark;
  const MyFilterChip({
    super.key,
    required this.selected,
    required this.onSelected,
    required this.label,
    this.checkMark = false
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      showCheckmark: checkMark,
      labelStyle: textTheme.labelLargeMedium.copyWith(color: selected ? AppTheme.white : AppTheme.gray500),
      labelPadding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacing4,
        vertical: AppTheme.spacing2
      ),
      selected: selected,
      pressElevation: 0,
      backgroundColor: AppTheme.gray100,
      checkmarkColor: AppTheme.white,
      selectedColor: AppTheme.primary500,
      label: Text(label),
      onSelected: onSelected
    );
  }
}