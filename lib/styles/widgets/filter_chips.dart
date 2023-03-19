import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';

class MyFilterChip extends StatelessWidget {
  final bool selected;
  final ValueChanged<bool>? onSelected;
  final String label;
  final bool checkMark;
  final bool closeMark;
  const MyFilterChip({
    super.key,
    required this.selected,
    required this.onSelected,
    required this.label,
    this.checkMark = false,
    this.closeMark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppTheme.borderRadiusXL,
        color: selected ? AppTheme.primary50 : AppTheme.gray100
      ),
      padding: EdgeInsets.zero,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FilterChip(
            showCheckmark: checkMark,
            labelStyle: textTheme.labelLargeMedium.copyWith(color: selected ? AppTheme.primary600 : AppTheme.gray500),
            labelPadding: EdgeInsets.only(
              left: AppTheme.spacing4,
              right: closeMark ? AppTheme.spacing2 :AppTheme.spacing4,
              top: AppTheme.spacing2,
              bottom: AppTheme.spacing2
            ),
            selected: selected,
            pressElevation: 0,
            backgroundColor: AppTheme.gray100,
            checkmarkColor: AppTheme.white,
            selectedColor: AppTheme.primary50,
            label: Text(label),
            onSelected: onSelected ?? (value) {}
          ),
          closeMark ? Icon(Icons.close, size: 20, color: AppTheme.primary600) : Container(),
          closeMark ? AppTheme.spacingWidget4 : Container()
        ],
      ),
    );
  }
}