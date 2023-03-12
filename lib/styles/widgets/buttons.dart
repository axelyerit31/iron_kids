import 'package:flutter/material.dart';
import 'package:iron_kids/styles/app_theme.dart';

// Altura de botones Large, Medium y Small
double buttonHeightL = 56;
double buttonHeightM = 46;
double buttonHeightS = 36;

// Tamaño de iconos Large. Medium y Small
double iconSizeL = 22;
double iconSizeM = 18;
double iconSizeS = 16;

// Spacing de iconosy texto Large. Medium y Small
double spacingButtonL = AppTheme.spacing7;
double spacingButtonM = AppTheme.spacing5;
double spacingButtonS = AppTheme.spacing4;

class ButtonBase extends StatelessWidget {
  final IconData? iconLeft;
  final IconData? iconRight;
  final ButtonStyle? style;
  final String text;
  final VoidCallback? onPressed;
  final int size;
  final Color textColor;
  final Color borderColor;

  const ButtonBase({
    Key? key,
    this.iconLeft,
    this.iconRight,
    this.style,
    required this.text,
    this.onPressed,
    required this.textColor,
    this.borderColor = Colors.transparent,
    this.size = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppTheme.borderRadiusL,
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: ClipRRect(
        borderRadius: AppTheme.borderRadiusL,
        child: SizedBox(
          height: size == 2 ? buttonHeightL : size == 1 ? buttonHeightM : buttonHeightS,
          child: TextButton(
            style: style!.copyWith(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(
                  horizontal: size == 2 ? spacingButtonL: size == 1 ? spacingButtonM : spacingButtonS
                )
              )
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                iconLeft == null ? Container() : Padding(
                  padding: const EdgeInsets.only(right: AppTheme.spacing3),
                  child: Icon(iconLeft, size: size == 2 ? iconSizeL : size == 1 ? iconSizeM : iconSizeS, color: textColor),
                ),
                Text(
                  text.isEmpty? "" : text,
                  style: size == 0 ? textTheme.labelMedium!.copyWith(color: textColor) : textTheme.labelLarge!.copyWith(color: textColor, fontWeight: FontWeight.w500),
                ),
                iconRight == null ? Container() : Padding(
                  padding: const EdgeInsets.only(left: AppTheme.spacing3),
                  child: Icon(iconRight, size: size == 2 ? iconSizeL : size == 1 ? iconSizeM : iconSizeS, color: textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonPrimary extends StatelessWidget {
  final IconData? iconLeft;
  final IconData? iconRight;
  final String text;
  final VoidCallback? onPressed;
  final int size;
  final bool disabled;

  const ButtonPrimary(this.text,{
    Key? key,
    this.iconLeft,
    this.iconRight,
    this.onPressed,
    this.size = 1,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBase(
      textColor: disabled ? AppTheme.gray50 : AppTheme.white,
      iconLeft: iconLeft,
      iconRight: iconRight,
      text: text,
      onPressed: disabled? null : onPressed?? () {},
      size: size,
      style: TextButton.styleFrom(
        backgroundColor: disabled ? AppTheme.gray300 : AppTheme.primary500,
        foregroundColor: AppTheme.primary900
      ),
    );
  }
}

class ButtonSecondary extends StatelessWidget {
  final IconData? iconLeft;
  final IconData? iconRight;
  final String text;
  final VoidCallback? onPressed;
  final int size;
  final bool disabled;

  const ButtonSecondary(this.text,{
    Key? key,
    this.iconLeft,
    this.iconRight,
    this.onPressed,
    this.size = 1,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBase(
      textColor: disabled ? AppTheme.gray400 : AppTheme.gray600,
      iconLeft: iconLeft,
      iconRight: iconRight,
      text: text,
      onPressed: disabled? null : onPressed?? () {},
      size: size,
      style: TextButton.styleFrom(
        backgroundColor: disabled ? AppTheme.gray100 : AppTheme.gray200,
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  final IconData? iconLeft;
  final IconData? iconRight;
  final String text;
  final Color color;
  final VoidCallback? onPressed;
  final int size;
  final bool disabled;

  const ButtonText(this.text,{
    Key? key,
    this.iconLeft,
    this.color = AppTheme.primary500,
    this.iconRight,
    this.onPressed,
    this.size = 1,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBase(
      textColor: disabled? AppTheme.gray300 : color,
      iconLeft: iconLeft,
      iconRight: iconRight,
      text: text,
      onPressed: disabled? null : onPressed?? () {},
      size: size,
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: AppTheme.primary600
      ),
    );
  }
}

class ButtonOutlined extends StatelessWidget {
  final IconData? iconLeft;
  final IconData? iconRight;
  final String text;
  final VoidCallback? onPressed;
  final int size;
  final bool disabled;

  const ButtonOutlined(this.text,{
    Key? key,
    this.iconLeft,
    this.iconRight,
    this.onPressed,
    this.size = 1,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBase(
      borderColor: disabled? AppTheme.gray300 : AppTheme.primary500,
      textColor: disabled? AppTheme.gray300 : AppTheme.primary500,
      iconLeft: iconLeft,
      iconRight: iconRight,
      text: text,
      onPressed: disabled? null : onPressed?? () {},
      size: size,
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: AppTheme.primary600
      ),
    );
  }
}

class ButtonSecondaryOutlined extends StatelessWidget {
  final IconData? iconLeft;
  final IconData? iconRight;
  final String text;
  final VoidCallback? onPressed;
  final int size;
  final bool disabled;

  const ButtonSecondaryOutlined(this.text,{
    Key? key,
    this.iconLeft,
    this.iconRight,
    this.onPressed,
    this.size = 1,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBase(
      borderColor: disabled? AppTheme.gray300 : AppTheme.primary500,
      textColor: disabled? AppTheme.gray300 : AppTheme.primary500,
      iconLeft: iconLeft,
      iconRight: iconRight,
      text: text,
      onPressed: disabled? null : onPressed?? () {},
      size: size,
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: AppTheme.primary600
      ),
    );
  }
}

class ButtonIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final int size;
  final Color backgroundColor;
  final Color iconColor;

  const ButtonIcon({
    Key? key,
    this.onPressed,
    this.size = 0,
    required this.icon,
    this.backgroundColor = AppTheme.primary500,
    this.iconColor = AppTheme.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: AppTheme.borderRadiusXL,
      color: backgroundColor,
      child: SizedBox(
        height: size == 1 ? buttonHeightL + 20 : buttonHeightL,
        width: size == 1 ? buttonHeightL + 20 : buttonHeightL,
        child: IconButton(
          color: iconColor,
          splashRadius: buttonHeightL/2,
          icon: Icon(icon),
          onPressed: onPressed ?? () {},
        ),
      ),
    );
  }
}